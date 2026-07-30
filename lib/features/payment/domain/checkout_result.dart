class CheckoutResult {
  const CheckoutResult({
    required this.transidmerchant,
    required this.transidstela,
    required this.subtotal,
    required this.adminFee,
    required this.grandTotal,
    required this.paymentOptions,
  });

  final String transidmerchant;
  final List<String> transidstela;
  final int subtotal;
  final int adminFee;
  final int grandTotal;
  final List<PaymentOption> paymentOptions;
}

class PaymentOption {
  const PaymentOption({
    required this.method,
    required this.channel,
    required this.label,
    required this.adminFee,
    required this.grandTotal,
    required this.enabled,
    this.disabledReason,
  });

  final String method;
  final String channel;
  final String label;
  final int adminFee;
  final int grandTotal;
  final bool enabled;
  final String? disabledReason;
}

class PaymentAttempt {
  const PaymentAttempt({
    required this.method,
    required this.channel,
    required this.subtotal,
    required this.adminFee,
    required this.grandTotal,
    this.virtualAccountNo,
    this.qrString,
    this.paymentUrl,
    this.paymentCode,
    this.expiredAt,
  });

  final String method;
  final String channel;
  final int subtotal;
  final int adminFee;
  final int grandTotal;
  final String? virtualAccountNo;
  final String? qrString;
  final String? paymentUrl;
  final String? paymentCode;
  final DateTime? expiredAt;
}
