import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/utils/currency_formatter.dart';
import '../../../../design_system/tokens/stela_colors.dart';
import '../../domain/checkout_result.dart';

class PaymentInstructionPage extends StatefulWidget {
  const PaymentInstructionPage({super.key, required this.attempt});

  final PaymentAttempt attempt;

  @override
  State<PaymentInstructionPage> createState() => _PaymentInstructionPageState();
}

class _PaymentInstructionPageState extends State<PaymentInstructionPage> {
  Timer? _timer;
  Duration? _remaining;

  @override
  void initState() {
    super.initState();
    _refreshRemaining();
    if (widget.attempt.expiredAt != null) {
      _timer = Timer.periodic(
        const Duration(seconds: 1),
        (_) => _refreshRemaining(),
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _refreshRemaining() {
    final expires = widget.attempt.expiredAt;
    if (expires == null) return;
    final remaining = expires.difference(DateTime.now());
    if (mounted) {
      setState(
        () => _remaining = remaining.isNegative ? Duration.zero : remaining,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final attempt = widget.attempt;
    final paymentValue =
        attempt.virtualAccountNo ?? attempt.paymentCode ?? attempt.qrString;
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pembayaran'),
            Text(
              'Pembayaran lebih mudah secara Online',
              style: TextStyle(
                fontSize: 11,
                color: StelaColors.primaryRed,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _CountdownCard(remaining: _remaining, total: attempt.grandTotal),
          const SizedBox(height: 16),
          _PaymentDetailCard(attempt: attempt, paymentValue: paymentValue),
          if (attempt.paymentUrl != null) ...[
            const SizedBox(height: 16),
            Text(
              'Tautan pembayaran tersedia dari gateway.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ],
      ),
    );
  }
}

class _CountdownCard extends StatelessWidget {
  const _CountdownCard({required this.remaining, required this.total});
  final Duration? remaining;
  final int total;

  @override
  Widget build(BuildContext context) {
    final duration = remaining;
    final hours = duration == null
        ? '--'
        : duration.inHours.remainder(100).toString().padLeft(2, '0');
    final minutes = duration == null
        ? '--'
        : duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration == null
        ? '--'
        : duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          const Text(
            'Selesaikan Pembayaran Dalam',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _TimePart(value: hours, label: 'Jam'),
              _TimePart(value: minutes, label: 'Menit'),
              _TimePart(value: seconds, label: 'Detik'),
            ],
          ),
          const SizedBox(height: 24),
          const Icon(
            Icons.account_balance_wallet_outlined,
            color: Colors.white,
            size: 52,
          ),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Total Amount to Pay',
              style: TextStyle(color: Colors.white.withValues(alpha: .7)),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              CurrencyFormatter.rupiah(total),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimePart extends StatelessWidget {
  const _TimePart({required this.value, required this.label});
  final String value;
  final String label;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 6),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: StelaColors.primaryRed,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 5),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    ),
  );
}

class _PaymentDetailCard extends StatelessWidget {
  const _PaymentDetailCard({required this.attempt, required this.paymentValue});
  final PaymentAttempt attempt;
  final String? paymentValue;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      border: Border.all(color: StelaColors.border),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Bayar ke',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
        ),
        const SizedBox(height: 14),
        Text(
          attempt.method == 'VIRTUAL_ACCOUNT'
              ? 'Virtual Account'
              : attempt.method,
        ),
        Text(attempt.channel, style: Theme.of(context).textTheme.titleMedium),
        if (paymentValue != null)
          _PaymentValue(
            value: paymentValue!,
            label: attempt.qrString != null
                ? 'QRIS string'
                : 'Nomor pembayaran',
          ),
      ],
    ),
  );
}

class _PaymentValue extends StatelessWidget {
  const _PaymentValue({required this.value, required this.label});
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 18),
      Text(label),
      const SizedBox(height: 4),
      Row(
        children: [
          Expanded(
            child: SelectableText(
              value,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          IconButton(
            onPressed: () => Clipboard.setData(ClipboardData(text: value)),
            icon: const Icon(Icons.copy_outlined),
            tooltip: 'Salin',
          ),
        ],
      ),
    ],
  );
}
