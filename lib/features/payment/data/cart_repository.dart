import 'package:dio/dio.dart';

import '../../../core/network/api_client.dart';
import '../domain/cart_preview.dart';
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

  Future<void> checkoutCart({
    required String cartReference,
    required String parentReference,
  }) async {
    await _apiClient.dio.post<Object>(
      '/api/v1/carts/$cartReference/checkout',
      data: FormData.fromMap({'parent_reference': parentReference}),
    );
  }

  Map<String, dynamic> _map(Object? value, String endpoint) {
    if (value is Map) {
      return value.map((key, value) => MapEntry(key.toString(), value));
    }
    throw CartContractException('$endpoint tidak mengembalikan objek JSON.');
  }

  String _requiredText(Map<String, dynamic> data, String field) {
    final result = data[field]?.toString().trim();
    if (result == null || result.isEmpty) {
      throw CartContractException('Respons cart tidak memiliki `$field`.');
    }
    return result;
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
