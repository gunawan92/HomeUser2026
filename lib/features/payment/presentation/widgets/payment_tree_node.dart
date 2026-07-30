import 'package:flutter/material.dart';

import '../../../../design_system/tokens/stela_colors.dart';
import '../../../../design_system/tokens/stela_radius.dart';
import '../../../../design_system/tokens/stela_spacing.dart';

class PaymentTreeNode extends StatelessWidget {
  const PaymentTreeNode({
    super.key,
    required this.level,
    required this.title,
    required this.expanded,
    required this.onPressed,
    required this.child,
    this.subtitle,
    this.leading,
    this.trailing,
  });

  final int level;
  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final bool expanded;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final motion = MediaQuery.disableAnimationsOf(context)
        ? Duration.zero
        : const Duration(milliseconds: 280);
    final indent = (level * 12.0).clamp(0, 36).toDouble();
    return Padding(
      padding: EdgeInsets.only(left: indent, bottom: StelaSpacing.sm),
      child: Stack(
        children: [
          if (level > 0)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(width: 1, color: StelaColors.border),
            ),
          if (level > 0)
            Positioned(
              left: 0,
              top: 30,
              child: Container(width: 10, height: 1, color: StelaColors.border),
            ),
          AnimatedContainer(
            duration: motion,
            decoration: BoxDecoration(
              color: expanded
                  ? StelaColors.warmBackground
                  : StelaColors.surface,
              borderRadius: BorderRadius.circular(StelaRadius.md),
              border: Border.all(
                color: expanded
                    ? StelaColors.primaryRed.withValues(alpha: .32)
                    : StelaColors.border,
              ),
            ),
            child: Column(
              children: [
                Semantics(
                  button: true,
                  expanded: expanded,
                  label: '$title, ${expanded ? 'terbuka' : 'tertutup'}',
                  child: InkWell(
                    onTap: onPressed,
                    borderRadius: BorderRadius.circular(StelaRadius.md),
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Row(
                        children: [
                          if (leading case final nodeLeading?) ...[
                            nodeLeading,
                            const SizedBox(width: StelaSpacing.sm),
                          ],
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                                if (subtitle != null) ...[
                                  const SizedBox(height: 3),
                                  Text(
                                    subtitle!,
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(
                                          color: StelaColors.textSecondary,
                                        ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                          trailing ?? const SizedBox.shrink(),
                          AnimatedRotation(
                            turns: expanded ? .5 : 0,
                            duration: motion,
                            child: const Icon(
                              Icons.keyboard_arrow_down_rounded,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ClipRect(
                  child: AnimatedSize(
                    duration: motion,
                    curve: Curves.easeOutCubic,
                    child: expanded
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                            child: child,
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
