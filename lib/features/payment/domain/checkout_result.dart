enum CheckoutPaymentStatus {
  pending,
  paymentRequested,
  paid,
  failed,
  expired,
  cancelled;

  static CheckoutPaymentStatus parse(String? value) {
    final normalized = value?.trim().toUpperCase();
    return switch (normalized) {
      'PAID' => CheckoutPaymentStatus.paid,
      'PAYMENT_REQUESTED' => CheckoutPaymentStatus.paymentRequested,
      'FAILED' => CheckoutPaymentStatus.failed,
      'EXPIRED' => CheckoutPaymentStatus.expired,
      'CANCELLED' => CheckoutPaymentStatus.cancelled,
      _ => CheckoutPaymentStatus.pending,
    };
  }

  bool get isFinal =>
      this == CheckoutPaymentStatus.paid ||
      this == CheckoutPaymentStatus.failed ||
      this == CheckoutPaymentStatus.expired ||
      this == CheckoutPaymentStatus.cancelled;

  bool get isPaid => this == CheckoutPaymentStatus.paid;
}

class CheckoutResult {
  const CheckoutResult({
    required this.transidmerchant,
    required this.transidstela,
    required this.subtotal,
    required this.adminFee,
    required this.grandTotal,
    required this.paymentOptions,
    this.paymentStatus = CheckoutPaymentStatus.pending,
    this.callbackReceived = false,
    this.paidAt,
  });

  final String transidmerchant;
  final List<String> transidstela;
  final int subtotal;
  final int adminFee;
  final int grandTotal;
  final List<PaymentOption> paymentOptions;
  final CheckoutPaymentStatus paymentStatus;
  final bool callbackReceived;
  final String? paidAt;
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
    this.paymentStatus = CheckoutPaymentStatus.pending,
    this.callbackReceived = false,
    this.paidAt,
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
  final CheckoutPaymentStatus paymentStatus;
  final bool callbackReceived;
  final String? paidAt;

  PaymentAttempt copyWithStatus({
    CheckoutPaymentStatus? paymentStatus,
    bool? callbackReceived,
    String? paidAt,
  }) => PaymentAttempt(
    method: method,
    channel: channel,
    subtotal: subtotal,
    adminFee: adminFee,
    grandTotal: grandTotal,
    virtualAccountNo: virtualAccountNo,
    qrString: qrString,
    paymentUrl: paymentUrl,
    paymentCode: paymentCode,
    expiredAt: expiredAt,
    paymentStatus: paymentStatus ?? this.paymentStatus,
    callbackReceived: callbackReceived ?? this.callbackReceived,
    paidAt: paidAt ?? this.paidAt,
  );
}
