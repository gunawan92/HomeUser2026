import '../../../core/network/api_client.dart';
import '../domain/payment_models.dart';
import '../domain/payment_repository.dart';

class ApiPaymentRepository implements PaymentRepository {
  ApiPaymentRepository(this._apiClient, this._parentReference);
  final ApiClient _apiClient;
  final String _parentReference;

  @override
  Future<List<ChildPaymentProfile>> getChildrenPayments() async {
    final response = await _apiClient.dio.get<Object>(
      '/api/v1/parents/$_parentReference/students',
    );
    final root = _map(
      response.data,
      'GET /parents/{parent_reference}/students',
    );
    final students = _requiredRows(root, 'students');
    return Future.wait(students.map(_loadChild));
  }

  Future<ChildPaymentProfile> _loadChild(Map<String, dynamic> student) async {
    final serial = _requiredText(student, 'student_reference');
    final billsResponse = await _apiClient.dio.get<Object>(
      '/api/v1/students/$serial/bills',
    );
    final billsData = _map(
      billsResponse.data,
      'GET /students/{student_reference}/bills',
    );
    final bills = _requiredRows(billsData, 'bills');
    final period = _requiredText(student, 'periode');
    final className = _requiredText(student, 'class_name');
    final idschool = _requiredText(student, 'idschool');
    final idclass = _requiredText(student, 'idclass');
    return ChildPaymentProfile(
      idschool: idschool,
      serial: serial,
      name: _requiredText(student, 'student_name'),
      schoolName: _requiredText(student, 'school_name'),
      periodLabel: period,
      periodReference: period,
      className: className,
      idclass: idclass,
      items: bills.map((bill) => _item(bill, serial)).toList(),
    );
  }

  PaymentItem _item(Map<String, dynamic> bill, String serial) {
    final rawStatus = _requiredText(bill, 'status').toLowerCase();
    final status = switch (rawStatus) {
      'available' => PaymentStatus.available,
      'paid' || 'lunas' => PaymentStatus.paid,
      'pending' || 'waiting' => PaymentStatus.pending,
      'unavailable' || 'disabled' || 'expired' => PaymentStatus.unavailable,
      _ => throw PaymentMetadataException(
        'Nilai status tagihan tidak dikenal: $rawStatus.',
      ),
    };
    final typeValue = _requiredText(bill, 'jenis_pembayaran').toLowerCase();
    final type = switch (typeValue) {
      'spp' => PaymentType.spp,
      'other' || 'lainnya' => PaymentType.other,
      _ => throw PaymentMetadataException(
        'Nilai jenis_pembayaran tidak dikenal: $typeValue.',
      ),
    };
    return PaymentItem(
      idschool: _requiredText(bill, 'idschool'),
      idclass: _requiredText(bill, 'idclass'),
      serial: serial,
      periode: _requiredText(bill, 'periode'),
      jenisPembayaran: type,
      referenceTambahan: _requiredText(bill, 'source_reference'),
      title: _requiredText(bill, 'title'),
      description: _text(bill['description']),
      amount: _requiredAmount(bill, 'amount'),
      status: status,
      disabledReason: _text(bill['disabled_reason']),
    );
  }

  Map<String, dynamic> _map(Object? value, String endpoint) {
    if (value is Map) {
      return value.map((key, value) => MapEntry(key.toString(), value));
    }
    throw PaymentMetadataException('$endpoint tidak mengembalikan objek JSON.');
  }

  List<Map<String, dynamic>> _requiredRows(
    Map<String, dynamic> root,
    String field,
  ) {
    final value = root[field];
    if (value is! List) {
      throw PaymentMetadataException(
        'Metadata wajib `$field` tidak ada atau bukan list.',
      );
    }
    if (value.any((row) => row is! Map)) {
      throw PaymentMetadataException(
        'Metadata `$field` berisi item yang bukan objek JSON.',
      );
    }
    return value
        .cast<Map>()
        .map((row) => row.map((key, value) => MapEntry(key.toString(), value)))
        .toList();
  }

  String _requiredText(Map<String, dynamic> data, String field) =>
      _text(data[field]) ??
      (throw PaymentMetadataException(
        'Metadata wajib `$field` tidak ada atau kosong.',
      ));
  String? _text(Object? value) {
    final text = value?.toString().trim();
    return text == null || text.isEmpty ? null : text;
  }

  int _requiredAmount(Map<String, dynamic> data, String field) {
    final result = int.tryParse(data[field]?.toString().split('.').first ?? '');
    if (result == null) {
      throw PaymentMetadataException(
        'Metadata wajib `$field` harus nominal integer IDR.',
      );
    }
    return result;
  }
}

class PaymentMetadataException implements Exception {
  const PaymentMetadataException(this.message);
  final String message;
  @override
  String toString() => message;
}
