import 'package:dio/dio.dart';

import '../../../core/network/api_client.dart';
import '../domain/cart_preview.dart';
import '../domain/checkout_result.dart';
import '../domain/payment_models.dart';

class CartRepository {
  CartRepository(this._apiClient);
  final ApiClient _apiClient;

  Future<CartPreview> prepareCart({
    required String parentReference,
    required List<PaymentItem> items,
  }) async {
    final cartResponse = await _apiClient.dio.post<Object>(
      '/api/v1/carts',
      data: FormData.fromMap({'parent_reference': parentReference}),
    );
    final cart = _map(cartResponse.data, 'POST /api/v1/carts');
    final cartReference = _requiredText(cart, 'cart_reference');
    for (final item in items) {
      await _apiClient.dio.post<Object>(
        '/api/v1/carts/$cartReference/items',
        data: FormData.fromMap({
          'parent_reference': parentReference,
          'student_reference': item.serial,
          'source_reference': item.referenceTambahan!,
        }),
      );
    }
    final summaryResponse = await _apiClient.dio.get<Object>(
      '/api/v1/carts/$cartReference/summary',
      queryParameters: {'parent_reference': parentReference},
    );
    final summary = _map(
      summaryResponse.data,
      'GET /api/v1/carts/{cart_reference}/summary',
    );
    return CartPreview(
      cartReference: cartReference,
      subtotal: _requiredAmount(summary, 'subtotal'),
      adminFee: _requiredAmount(summary, 'admin_fee'),
      grandTotal: _requiredAmount(summary, 'grand_total'),
    );
  }

  Future<CheckoutResult> checkoutCart({
    required String cartReference,
    required String parentReference,
  }) async {
    final checkoutResponse = await _apiClient.dio.post<Object>(
      '/api/v1/carts/$cartReference/checkout',
      data: FormData.fromMap({'parent_reference': parentReference}),
    );
    final checkout = _map(
      checkoutResponse.data,
      'POST /api/v1/carts/{cart_reference}/checkout',
    );
    final transidmerchant = _requiredText(checkout, 'transidmerchant');
    final summaryResponse = await _apiClient.dio.get<Object>(
      '/api/v1/checkouts/$transidmerchant/summary',
    );
    final summary = _map(
      summaryResponse.data,
      'GET /api/v1/checkouts/{transidmerchant}/summary',
    );
    final transactions = summary['transactions'];
    if (transactions is! List || transactions.isEmpty) {
      throw const CartContractException(
        'Respons checkout tidak memiliki daftar `transactions`.',
      );
    }
    final transidstela = transactions
        .map((transaction) {
          if (transaction is! Map) {
            throw const CartContractException(
              'Item `transactions` tidak valid.',
            );
          }
          return _requiredText(
            transaction.map((key, value) => MapEntry(key.toString(), value)),
            'transidstela',
          );
        })
        .toList(growable: false);
    final amounts = _requiredMap(summary, 'amounts');
    return CheckoutResult(
      transidmerchant: transidmerchant,
      transidstela: transidstela,
      subtotal: _requiredAmount(amounts, 'subtotal'),
      adminFee: _requiredAmount(amounts, 'admin_fee'),
      grandTotal: _requiredAmount(amounts, 'grand_total'),
      paymentOptions: _requiredPaymentOptions(summary),
    );
  }

  Future<PaymentAttempt> createPayment({
    required String transidmerchant,
    required PaymentOption option,
  }) async {
    try {
      final response = await _apiClient.dio.post<Object>(
        '/api/v1/checkouts/$transidmerchant/payment',
        data: {'method': option.method, 'channel': option.channel},
      );
      final result = _map(
        response.data,
        'POST /api/v1/checkouts/{transidmerchant}/payment',
      );
      final amounts = _requiredMap(result, 'amounts');
      return PaymentAttempt(
        // Kontrak menjamin method/channel pada request, tetapi tidak
        // mewajibkan keduanya diulang di respons payment.
        method: option.method,
        channel: option.channel,
        subtotal: _requiredAmount(amounts, 'subtotal'),
        adminFee: _requiredAmount(amounts, 'admin_fee'),
        grandTotal: _requiredAmount(amounts, 'grand_total'),
        virtualAccountNo: _optionalText(result, 'virtual_account_no'),
        qrString: _optionalText(result, 'qr_string'),
        paymentUrl: _optionalText(result, 'payment_url'),
        paymentCode: _optionalText(result, 'payment_code'),
        expiredAt: _optionalDate(result, 'expired_at'),
      );
    } on DioException catch (error) {
      throw CartContractException(_paymentErrorMessage(error));
    }
  }

  String _paymentErrorMessage(DioException error) {
    if (error.response?.statusCode == 409) {
      return 'Instruksi pembayaran untuk tagihan ini sudah pernah dibuat. '
          'Silakan buka kembali detail pembayaran yang sama.';
    }
    final data = error.response?.data;
    if (data is Map) {
      final message = data['message']?.toString().trim();
      if (message != null && message.isNotEmpty) return message;
    }
    return 'Pembayaran belum dapat dibuat. Periksa koneksi lalu coba lagi.';
  }

  Map<String, dynamic> _map(Object? value, String endpoint) {
    if (value is Map) {
      return value.map((key, value) => MapEntry(key.toString(), value));
    }
    throw CartContractException('$endpoint tidak mengembalikan objek JSON.');
  }

  Map<String, dynamic> _requiredMap(Map<String, dynamic> data, String field) {
    final value = data[field];
    if (value is Map) {
      return value.map((key, value) => MapEntry(key.toString(), value));
    }
    throw CartContractException('Respons cart tidak memiliki objek `$field`.');
  }

  List<PaymentOption> _requiredPaymentOptions(Map<String, dynamic> data) {
    final value = data['payment_options'];
    if (value is! List || value.isEmpty) {
      throw const CartContractException(
        'Respons checkout tidak memiliki `payment_options`.',
      );
    }
    return value
        .map((item) {
          if (item is! Map) {
            throw const CartContractException(
              'Item `payment_options` tidak valid.',
            );
          }
          final option = item.map(
            (key, value) => MapEntry(key.toString(), value),
          );
          if (option['enabled'] is! bool) {
            throw const CartContractException(
              'Field `payment_options.enabled` wajib boolean.',
            );
          }
          return PaymentOption(
            method: _requiredText(option, 'method'),
            channel: _requiredText(option, 'channel'),
            label: _requiredText(option, 'label'),
            adminFee: _requiredAmount(option, 'admin_fee'),
            grandTotal: _requiredAmount(option, 'grand_total'),
            enabled: option['enabled'] as bool,
            disabledReason: _optionalText(option, 'disabled_reason'),
          );
        })
        .toList(growable: false);
  }

  String _requiredText(Map<String, dynamic> data, String field) {
    final result = data[field]?.toString().trim();
    if (result == null || result.isEmpty) {
      throw CartContractException('Respons cart tidak memiliki `$field`.');
    }
    return result;
  }

  String? _optionalText(Map<String, dynamic> data, String field) {
    final result = data[field]?.toString().trim();
    return result == null || result.isEmpty ? null : result;
  }

  DateTime? _optionalDate(Map<String, dynamic> data, String field) {
    final value = _optionalText(data, field);
    if (value == null) return null;
    final parsed = DateTime.tryParse(value);
    if (parsed == null) {
      throw CartContractException(
        'Field `$field` harus berupa tanggal ISO-8601.',
      );
    }
    return parsed;
  }

  int _requiredAmount(Map<String, dynamic> data, String field) {
    final result = int.tryParse(data[field]?.toString().split('.').first ?? '');
    if (result == null) {
      throw CartContractException(
        'Respons summary tidak memiliki nominal integer `$field`.',
      );
    }
    return result;
  }
}

class CartContractException implements Exception {
  const CartContractException(this.message);
  final String message;
  @override
  String toString() => message;
}
