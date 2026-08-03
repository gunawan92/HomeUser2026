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
    final normalizedParentReference = parentReference.trim();
    if (normalizedParentReference.isEmpty) {
      throw const CartContractException(
        'Sesi tidak memiliki parent_reference yang valid.',
      );
    }
    final cartResponse = await _apiClient.dio.post<Object>(
      '/api/v1/carts',
      data: {'parent_reference': normalizedParentReference},
      options: Options(contentType: Headers.jsonContentType),
    );
    final cart = _map(cartResponse.data, 'POST /api/v1/carts');
    final cartReference = _requiredText(cart, 'cart_reference');
    for (final item in items) {
      await _apiClient.dio.post<Object>(
        '/api/v1/carts/$cartReference/items',
        data: {
          'parent_reference': normalizedParentReference,
          'student_reference': item.serial,
          'source_reference': item.referenceTambahan!,
        },
        options: Options(contentType: Headers.jsonContentType),
      );
    }
    final summaryResponse = await _apiClient.dio.get<Object>(
      '/api/v1/carts/$cartReference/summary',
      queryParameters: {'parent_reference': normalizedParentReference},
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
    final normalizedParentReference = parentReference.trim();
    if (normalizedParentReference.isEmpty) {
      throw const CartContractException(
        'Sesi tidak memiliki parent_reference yang valid.',
      );
    }
    final checkoutResponse = await _apiClient.dio.post<Object>(
      '/api/v1/carts/$cartReference/checkout',
      data: {'parent_reference': normalizedParentReference},
      options: Options(contentType: Headers.jsonContentType),
    );
    final checkout = _map(
      checkoutResponse.data,
      'POST /api/v1/carts/{cart_reference}/checkout',
    );
    final transidmerchant = _requiredText(checkout, 'transidmerchant');
    return getCheckoutSummary(transidmerchant);
  }

  Future<CheckoutResult> getCheckoutSummary(String transidmerchant) async {
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
    final transidstela = <String>[];
    final transactionItems = transactions
        .map((transaction) {
          if (transaction is! Map) {
            throw const CartContractException(
              'Item `transactions` tidak valid.',
            );
          }
          final tx = transaction.map(
            (key, value) => MapEntry(key.toString(), value),
          );
          final idstela = _requiredText(tx, 'transidstela');
          transidstela.add(idstela);
          final studentRef = _optionalText(tx, 'student_reference') ??
              _optionalText(tx, 'student_serial') ??
              '';
          final studentSer = _optionalText(tx, 'student_serial') ??
              _optionalText(tx, 'student_reference') ??
              '';
          return CheckoutTransactionItem(
            transidstela: idstela,
            studentReference: studentRef,
            studentSerial: studentSer,
            studentName: _optionalText(tx, 'student_name'),
            schoolName: _optionalText(tx, 'school_name'),
            idschool: _optionalText(tx, 'idschool'),
            idclass: _optionalText(tx, 'idclass'),
            className: _optionalText(tx, 'class_name'),
            periode: _optionalText(tx, 'periode'),
            description: _optionalText(tx, 'description') ?? 'Tagihan',
            amount: _requiredAmount(tx, 'amount'),
            status: _optionalText(tx, 'status') ?? 'CREATED',
          );
        })
        .toList(growable: false);

    final amounts = _requiredMap(summary, 'amounts');

    final paymentMap = summary['payment'] is Map
        ? (summary['payment'] as Map).map((k, v) => MapEntry(k.toString(), v))
        : null;
    final latestAttemptMap = summary['latest_attempt'] is Map
        ? (summary['latest_attempt'] as Map).map((k, v) => MapEntry(k.toString(), v))
        : null;
    final statusString = _optionalText(paymentMap ?? {}, 'status') ??
        _optionalText(latestAttemptMap ?? {}, 'status');
    final paymentStatus = CheckoutPaymentStatus.parse(statusString);
    final callbackReceived = paymentMap?['callback_received'] == true;
    final paidAt = _optionalText(paymentMap ?? {}, 'paid_at');

    return CheckoutResult(
      transidmerchant: transidmerchant,
      transidstela: transidstela,
      subtotal: _requiredAmount(amounts, 'subtotal'),
      adminFee: _requiredAmount(amounts, 'admin_fee'),
      grandTotal: _requiredAmount(amounts, 'grand_total'),
      paymentOptions: _requiredPaymentOptions(summary),
      transactions: transactionItems,
      paymentStatus: paymentStatus,
      callbackReceived: callbackReceived,
      paidAt: paidAt,
    );
  }

  Future<PaymentAttempt> createPayment({
    required String transidmerchant,
    required PaymentOption option,
  }) async {
    try {
      final liveCheckout = await getCheckoutSummary(transidmerchant);
      final liveOption = liveCheckout.paymentOptions
          .where(
            (candidate) =>
                candidate.method == option.method &&
                candidate.channel == option.channel,
          )
          .firstOrNull;
      if (liveOption == null) {
        throw const CartContractException(
          'Metode pembayaran yang dipilih tidak lagi tersedia. Pilih ulang metodenya.',
        );
      }
      if (!liveOption.enabled) {
        throw CartContractException(
          liveOption.disabledReason ??
              'Metode pembayaran yang dipilih sedang tidak tersedia.',
        );
      }
      final response = await _apiClient.dio.post<Object>(
        '/api/v1/checkouts/$transidmerchant/payment',
        data: {'method': liveOption.method, 'channel': liveOption.channel},
        options: Options(contentType: Headers.jsonContentType),
      );
      final result = _map(
        response.data,
        'POST /api/v1/checkouts/{transidmerchant}/payment',
      );
      final amounts = _requiredMap(result, 'amounts');
      return PaymentAttempt(
        // Kontrak menjamin method/channel pada request, tetapi tidak
        // mewajibkan keduanya diulang di respons payment.
        method: liveOption.method,
        channel: liveOption.channel,
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
      final payloadError = data['error'];
      if (payloadError is Map) {
        final detail = payloadError.map(
          (key, value) => MapEntry(key.toString(), value),
        );
        final code = detail['code']?.toString().trim();
        final message = detail['message']?.toString().trim();
        final providerMessage = detail['provider_response_message']
            ?.toString()
            .trim();
        if (code == 'payment_option_not_available') {
          return 'Metode pembayaran yang dipilih sedang tidak tersedia. '
              'Silakan pilih metode lain.';
        }
        if (providerMessage != null && providerMessage.isNotEmpty) {
          return providerMessage;
        }
        if (message != null && message.isNotEmpty) return message;
        if (code != null && code.isNotEmpty) {
          return 'Permintaan pembayaran ditolak: $code.';
        }
      }
      final message = (data['message'] ?? data['errors'])?.toString().trim();
      if (message != null && message.isNotEmpty) return message;
    }
    if (error.response?.statusCode == 400) {
      return 'Data metode pembayaran ditolak oleh server.';
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
