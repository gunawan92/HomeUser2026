import 'package:flutter/material.dart';

import '../../../../core/utils/currency_formatter.dart';
import '../../../../design_system/tokens/stela_colors.dart';
import '../../domain/payment_models.dart';

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
  Widget build(BuildContext context) {
    final fullTitle = item.title
        .replaceAll(RegExp(r'^SPP\s*', caseSensitive: false), '')
        .trim();
    final displayTitle = _abbreviateMonth(item.title);

    if (item.status == PaymentStatus.paid) {
      return Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFEBEBEB),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFB0B0B0)),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.check_circle,
              color: Color(0xFF2E7D32),
              size: 24,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                fullTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF4CAF50)),
              ),
              child: const Text(
                'Lunas',
                style: TextStyle(
                  color: Color(0xFF2E7D32),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      );
    }

    final isSelectable = item.isSelectable;
    final borderColor = isSelected
        ? StelaColors.primaryRed
        : isSelectable
            ? const Color(0xFFB71C1C)
            : const Color(0xFFB0B0B0);

    return Material(
      color: isSelectable ? Colors.white : const Color(0xFFEBEBEB),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: isSelectable ? onTap : null,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: borderColor,
              width: isSelected || isSelectable ? 1.5 : 1,
            ),
          ),
          child: Row(
            children: [
              _SelectionCircle(selected: isSelected, enabled: isSelectable),
              const SizedBox(width: 24),
              Expanded(
                child: Text(
                  CurrencyFormatter.rupiah(item.amount),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                    color: isSelectable ? Colors.black : Colors.black45,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                displayTitle,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 11,
                  color: isSelectable ? Colors.black87 : Colors.black45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
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
      width: 26,
      height: 26,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected
              ? StelaColors.primaryRed
              : enabled
                  ? Colors.black87
                  : const Color(0xFF9E9E9E),
          width: 2.2,
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

String _abbreviateMonth(String title) {
  var cleaned = title
      .replaceAll(RegExp(r'^SPP\s*', caseSensitive: false), '')
      .trim();

  const monthMap = {
    'januari': 'Jan', 'january': 'Jan',
    'februari': 'Feb', 'february': 'Feb',
    'maret': 'Mar', 'march': 'Mar',
    'april': 'Apr',
    'mei': 'Mei', 'may': 'May',
    'juni': 'Jun', 'june': 'Jun',
    'juli': 'Jul', 'july': 'Jul',
    'agustus': 'Agu', 'august': 'Aug',
    'september': 'Sep',
    'oktober': 'Okt', 'october': 'Oct',
    'november': 'Nov',
    'desember': 'Des', 'december': 'Dec',
  };

  for (final entry in monthMap.entries) {
    cleaned = cleaned.replaceAll(
      RegExp('\\b${entry.key}\\b', caseSensitive: false),
      entry.value,
    );
  }
  return cleaned;
}
