import 'package:flutter/material.dart';

class StelaOfflineBanner extends StatelessWidget {
  const StelaOfflineBanner({super.key, required this.visible});
  final bool visible;

  @override
  Widget build(BuildContext context) => visible
      ? const MaterialBanner(
          content: Text('Anda offline. Data cache dan draft masih tersedia.'),
          actions: [SizedBox.shrink()],
        )
      : const SizedBox.shrink();
}
