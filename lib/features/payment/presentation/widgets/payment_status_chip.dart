import 'package:flutter/material.dart';

import '../../../../design_system/tokens/stela_colors.dart';
import '../../domain/payment_models.dart';

class PaymentStatusChip extends StatelessWidget {
  const PaymentStatusChip({super.key, required this.status});
  final PaymentStatus status;

  @override
  Widget build(BuildContext context) {
    final data = switch (status) {
      PaymentStatus.available => ('Tersedia', StelaColors.success),
      PaymentStatus.paid => ('Lunas', StelaColors.success),
      PaymentStatus.pending => ('Menunggu', StelaColors.warning),
      PaymentStatus.unavailable => (
        'Belum tersedia',
        StelaColors.textSecondary,
      ),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: data.$2.withValues(alpha: .12),
        borderRadius: BorderRadius.circular(99),
      ),
      child: Text(
        data.$1,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: data.$2,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
