import 'payment_models.dart';

abstract interface class PaymentRepository {
  Future<List<ChildPaymentProfile>> getChildrenPayments();
}
