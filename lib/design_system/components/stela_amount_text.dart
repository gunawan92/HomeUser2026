import 'package:flutter/material.dart';

import '../../core/utils/currency_formatter.dart';

class StelaAmountText extends StatelessWidget {
  const StelaAmountText({super.key, required this.amount});
  final int amount;

  @override
  Widget build(BuildContext context) => Text(
    CurrencyFormatter.rupiah(amount),
    style: Theme.of(context).textTheme.titleLarge,
  );
}
