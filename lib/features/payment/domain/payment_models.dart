enum PaymentType { spp, other }

enum PaymentStatus { available, paid, pending, unavailable }

enum PaymentMethod { virtualAccount, qris, alfamart }

class PaymentItem {
  const PaymentItem({
    required this.idschool,
    required this.idclass,
    required this.serial,
    required this.periode,
    required this.jenisPembayaran,
    required this.title,
    required this.amount,
    required this.status,
    this.referenceTambahan,
    this.description,
    this.dueDate,
    this.disabledReason,
  });
  final String idschool;
  final String idclass;
  final String serial;
  final String periode;
  final PaymentType jenisPembayaran;
  final String? referenceTambahan;
  final String title;
  final String? description;
  final DateTime? dueDate;
  final int amount;
  final PaymentStatus status;
  final String? disabledReason;
  bool get isSelectable => status == PaymentStatus.available;
  String get selectionKey =>
      '$idschool|$idclass|$serial|$periode|${jenisPembayaran.name}|${referenceTambahan ?? title}';
}

class ChildPaymentProfile {
  const ChildPaymentProfile({
    required this.idschool,
    required this.serial,
    required this.name,
    required this.schoolName,
    required this.periodLabel,
    required this.periodReference,
    required this.className,
    required this.idclass,
    required this.items,
  });
  final String idschool;
  final String serial;
  final String name;
  final String schoolName;
  final String periodLabel;
  final String periodReference;
  final String className;
  final String idclass;
  final List<PaymentItem> items;
  int get availableCount => items.where((item) => item.isSelectable).length;
  int get totalAvailable => items
      .where((item) => item.isSelectable)
      .fold(0, (total, item) => total + item.amount);
}
