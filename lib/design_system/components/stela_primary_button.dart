import 'package:flutter/material.dart';

class StelaPrimaryButton extends StatelessWidget {
  const StelaPrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
  });
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) => FilledButton(
    onPressed: isLoading ? null : onPressed,
    style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(48)),
    child: isLoading
        ? const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : Text(label),
  );
}
