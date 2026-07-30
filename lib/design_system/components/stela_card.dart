import 'package:flutter/material.dart';

import '../tokens/stela_colors.dart';
import '../tokens/stela_radius.dart';
import '../tokens/stela_shadows.dart';
import '../tokens/stela_spacing.dart';

class StelaCard extends StatelessWidget {
  const StelaCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(StelaSpacing.md),
  });
  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) => Container(
    padding: padding,
    decoration: BoxDecoration(
      color: StelaColors.surface,
      borderRadius: BorderRadius.circular(StelaRadius.lg),
      border: Border.all(color: StelaColors.border),
      boxShadow: const [StelaShadows.card],
    ),
    child: child,
  );
}
