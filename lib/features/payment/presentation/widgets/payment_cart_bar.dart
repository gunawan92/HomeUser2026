import 'package:flutter/material.dart';

import '../../../../core/utils/currency_formatter.dart';
import '../../../../design_system/tokens/stela_colors.dart';
import '../../../../design_system/tokens/stela_radius.dart';
import '../../../../design_system/tokens/stela_shadows.dart';
import '../../../../design_system/tokens/stela_spacing.dart';
import '../../domain/payment_models.dart';

class PaymentStickyCheckoutBar extends StatelessWidget {
  const PaymentStickyCheckoutBar({
    super.key,
    required this.items,
    required this.onContinue,
    this.isLoading = false,
  });

  final List<PaymentItem> items;
  final VoidCallback onContinue;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final total = items.fold(0, (sum, item) => sum + item.amount);
    return SafeArea(
      top: false,
      child: Material(
        color: StelaColors.surface,
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.all(StelaSpacing.md),
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: StelaColors.border)),
            boxShadow: [StelaShadows.card],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PaymentSelectionSummary(items: items, total: total),
              const SizedBox(height: StelaSpacing.sm),
              _ContinueButton(onPressed: onContinue, isLoading: isLoading),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentSelectionSummary extends StatelessWidget {
  const PaymentSelectionSummary({
    super.key,
    required this.items,
    required this.total,
  });
  final List<PaymentItem> items;
  final int total;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Text(
          '${items.length} tagihan dipilih',
          key: ValueKey(items.length),
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
      const SizedBox(height: 2),
      Text(
        CurrencyFormatter.rupiah(total),
        style: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(color: StelaColors.primaryRed),
      ),
    ],
  );
}

class _ContinueButton extends StatelessWidget {
  const _ContinueButton({required this.onPressed, required this.isLoading});
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) => FilledButton(
    onPressed: isLoading ? null : onPressed,
    style: FilledButton.styleFrom(
      minimumSize: const Size.fromHeight(52),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(StelaRadius.md),
      ),
      backgroundColor: StelaColors.primaryRed,
    ),
    child: isLoading
        ? const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : const Text('Lanjutkan'),
  );
}
