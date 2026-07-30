import 'package:flutter/material.dart';

import '../../../../core/utils/currency_formatter.dart';
import '../../../../design_system/tokens/stela_colors.dart';
import '../../../../design_system/tokens/stela_radius.dart';
import '../../../../design_system/tokens/stela_spacing.dart';
import '../../domain/payment_models.dart';
import 'payment_status_chip.dart';

class PaymentItemSelectableCard extends StatelessWidget {
  const PaymentItemSelectableCard({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onTap,
  });
  final PaymentItem item;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Material(
    color: item.isSelectable ? StelaColors.surface : StelaColors.warmBackground,
    borderRadius: BorderRadius.circular(StelaRadius.md),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(StelaRadius.md),
      child: Container(
        padding: const EdgeInsets.all(StelaSpacing.md),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(StelaRadius.md),
          border: Border.all(
            color: item.isSelectable
                ? StelaColors.primaryRed
                : StelaColors.textSecondary,
            width: isSelected || item.isSelectable ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            _SelectionCircle(selected: isSelected, enabled: item.isSelectable),
            const SizedBox(width: StelaSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  if (item.description != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      item.description!,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                  const SizedBox(height: 8),
                  PaymentStatusChip(status: item.status),
                ],
              ),
            ),
            const SizedBox(width: StelaSpacing.sm),
            Text(
              CurrencyFormatter.rupiah(item.amount),
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: StelaColors.primaryRed),
            ),
          ],
        ),
      ),
    ),
  );
}

class _SelectionCircle extends StatelessWidget {
  const _SelectionCircle({required this.selected, required this.enabled});
  final bool selected;
  final bool enabled;

  @override
  Widget build(BuildContext context) => Semantics(
    checked: selected,
    enabled: enabled,
    child: Container(
      width: 28,
      height: 28,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected
              ? StelaColors.primaryRed
              : enabled
              ? StelaColors.textPrimary
              : StelaColors.textSecondary,
          width: 2.5,
        ),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected ? StelaColors.primaryRed : Colors.transparent,
        ),
      ),
    ),
  );
}
