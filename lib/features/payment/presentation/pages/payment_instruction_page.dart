import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/currency_formatter.dart';
import '../../../../design_system/tokens/stela_colors.dart';
import '../../application/payment_controller.dart';
import '../../domain/checkout_result.dart';

class PaymentInstructionPage extends ConsumerStatefulWidget {
  const PaymentInstructionPage({super.key, required this.attempt});

  final PaymentAttempt attempt;

  @override
  ConsumerState<PaymentInstructionPage> createState() =>
      _PaymentInstructionPageState();
}

class _PaymentInstructionPageState
    extends ConsumerState<PaymentInstructionPage> {
  Timer? _countdownTimer;
  Timer? _pollTimer;
  Duration? _remaining;

  @override
  void initState() {
    super.initState();
    _refreshRemaining();
    if (widget.attempt.expiredAt != null) {
      _countdownTimer = Timer.periodic(
        const Duration(seconds: 1),
        (_) => _refreshRemaining(),
      );
    }
    // Poll payment status every 5 seconds from BE
    _pollTimer = Timer.periodic(
      const Duration(seconds: 5),
      (_) => _pollStatus(),
    );
    Future<void>.microtask(_pollStatus);
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _pollTimer?.cancel();
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

  Future<void> _pollStatus() async {
    final state = ref.read(paymentControllerProvider);
    final transid = state.checkoutResult?.transidmerchant;
    if (transid == null) return;
    final status = await ref
        .read(paymentControllerProvider.notifier)
        .checkPaymentStatus(transid);
    if (status.isFinal) {
      _pollTimer?.cancel();
      _countdownTimer?.cancel();
    }
  }

  void _popToBillsList() {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(paymentControllerProvider);
    final attempt = state.paymentAttempt ?? widget.attempt;
    final checkout = state.checkoutResult;
    final status = state.paymentStatus != CheckoutPaymentStatus.pending
        ? state.paymentStatus
        : attempt.paymentStatus;
    final paymentValue =
        attempt.virtualAccountNo ?? attempt.paymentCode ?? attempt.qrString;

    return Scaffold(
      backgroundColor: const Color(0xFFFAF5EC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF5EC),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left_rounded, size: 30),
          onPressed: _popToBillsList,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pembayaran',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              status.isPaid
                  ? 'Pembayaran Berhasil'
                  : 'Pembayaran lebih mudah secara Online',
              style: TextStyle(
                fontSize: 11,
                color: status.isPaid
                    ? const Color(0xFF2E7D32)
                    : StelaColors.primaryRed,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (status.isPaid) ...[
            _SuccessCard(
              paidAt: state.paidAt ?? attempt.paidAt,
              total: attempt.grandTotal,
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: _popToBillsList,
              icon: const Icon(Icons.arrow_back),
              label: const Text('Kembali ke Daftar Tagihan'),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(52),
                backgroundColor: const Color(0xFF2E7D32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ] else if (status == CheckoutPaymentStatus.expired ||
              status == CheckoutPaymentStatus.failed ||
              status == CheckoutPaymentStatus.cancelled) ...[
            _FailedCard(status: status),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: _popToBillsList,
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Buat Pembayaran Baru'),
            ),
          ] else ...[
            _StatusBanner(status: status, isPolling: state.isPollingStatus),
            const SizedBox(height: 14),
            _TopSummaryBlackCard(
              remaining: _remaining,
              total: attempt.grandTotal,
              invoiceNumber: checkout?.transidmerchant ?? '20260801001',
              items: state.selectedItems,
            ),
            const SizedBox(height: 16),
            _PleasePayToCard(attempt: attempt, paymentValue: paymentValue),
            const SizedBox(height: 16),
            _HowToPaySection(channel: attempt.channel),
          ],
        ],
      ),
    );
  }
}

class _StatusBanner extends StatelessWidget {
  const _StatusBanner({required this.status, required this.isPolling});
  final CheckoutPaymentStatus status;
  final bool isPolling;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    decoration: BoxDecoration(
      color: const Color(0xFFFFF8E1),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: const Color(0xFFFFB300)),
    ),
    child: Row(
      children: [
        if (isPolling)
          const SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        else
          const Icon(Icons.access_time_filled_rounded, color: Color(0xFFF57F17)),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Menunggu Pembayaran',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFE65100),
                ),
              ),
              Text(
                'Status pembayaran diperbarui secara otomatis dari server.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: const Color(0xFFBF360C),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _TopSummaryBlackCard extends StatelessWidget {
  const _TopSummaryBlackCard({
    required this.remaining,
    required this.total,
    required this.invoiceNumber,
    required this.items,
  });

  final Duration? remaining;
  final int total;
  final String invoiceNumber;
  final List<dynamic> items;

  @override
  Widget build(BuildContext context) {
    final duration = remaining;
    final hours = duration == null
        ? '05'
        : duration.inHours.remainder(100).toString().padLeft(2, '0');
    final minutes = duration == null
        ? '05'
        : duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration == null
        ? '05'
        : duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0F0F0F),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Text(
            'Selesaikan Pembayaran Dalam',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _TimeDigitBox(value: hours, label: 'Jam'),
              _TimeDigitBox(value: minutes, label: 'Menit'),
              _TimeDigitBox(value: seconds, label: 'Detik'),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset('assets/branding/logo_stela.png'),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'STELA Indonesia',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order Summary',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: .6),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Invoice Number : $invoiceNumber',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Amount to Pay',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: .6),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        'IDR  ${_formatNumber(total)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 6),
                      InkWell(
                        onTap: () {
                          Clipboard.setData(
                            ClipboardData(text: total.toString()),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Nominal disalin!'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.copy_outlined,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: () => _showDetailBottomSheet(context, total, items),
                child: const Text(
                  'Detail Pembayaran',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static String _formatNumber(int amount) {
    final str = amount.toString();
    final buffer = StringBuffer();
    for (int i = 0; i < str.length; i++) {
      if (i > 0 && (str.length - i) % 3 == 0) buffer.write('.');
      buffer.write(str[i]);
    }
    return buffer.toString();
  }

  void _showDetailBottomSheet(
    BuildContext context,
    int total,
    List<dynamic> items,
  ) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Detail Rincian Pembayaran',
                style: Theme.of(ctx).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              for (final item in items)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item.title.toString()),
                      Text(CurrencyFormatter.rupiah(item.amount as int)),
                    ],
                  ),
                ),
              const Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total IDR', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    CurrencyFormatter.rupiah(total),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: StelaColors.primaryRed,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TimeDigitBox extends StatelessWidget {
  const _TimeDigitBox({required this.value, required this.label});
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: StelaColors.primaryRed,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 13),
        ),
      ],
    ),
  );
}

class _PleasePayToCard extends StatelessWidget {
  const _PleasePayToCard({required this.attempt, required this.paymentValue});
  final PaymentAttempt attempt;
  final String? paymentValue;

  @override
  Widget build(BuildContext context) {
    final bankName = attempt.channel.isNotEmpty
        ? attempt.channel
        : (attempt.method == 'VIRTUAL_ACCOUNT' ? 'Mandiri' : attempt.method);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Please Pay To',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      attempt.method == 'VIRTUAL_ACCOUNT'
                          ? 'Virtual Account'
                          : attempt.method,
                      style: TextStyle(
                        color: Colors.black.withValues(alpha: .6),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      bankName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Virtual Account Number',
                      style: TextStyle(
                        color: Colors.black.withValues(alpha: .6),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 2),
                    if (paymentValue != null)
                      Row(
                        children: [
                          Flexible(
                            child: SelectableText(
                              paymentValue!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          InkWell(
                            onTap: () {
                              Clipboard.setData(
                                ClipboardData(text: paymentValue!),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Nomor Virtual Account disalin!'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.copy_outlined,
                              size: 18,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              _BankLogoBadge(bankName: bankName),
            ],
          ),
        ],
      ),
    );
  }
}

class _BankLogoBadge extends StatelessWidget {
  const _BankLogoBadge({required this.bankName});
  final String bankName;

  @override
  Widget build(BuildContext context) {
    final name = bankName.toLowerCase();
    Color badgeColor = const Color(0xFF003D79);
    String label = bankName;

    if (name.contains('mandiri')) {
      badgeColor = const Color(0xFF003D79);
      label = 'mandırı';
    } else if (name.contains('bca')) {
      badgeColor = const Color(0xFF005696);
      label = 'BCA';
    } else if (name.contains('bri')) {
      badgeColor = const Color(0xFF00529C);
      label = 'BRI';
    } else if (name.contains('bni')) {
      badgeColor = const Color(0xFF005E6A);
      label = 'BNI';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: badgeColor.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: badgeColor,
          fontWeight: FontWeight.bold,
          fontSize: 16,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}

class _HowToPaySection extends StatelessWidget {
  const _HowToPaySection({required this.channel});
  final String channel;

  @override
  Widget build(BuildContext context) {
    final titleChannel = channel.isNotEmpty ? channel : 'Mandiri';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How To Pay',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        _HowToPayTile(
          title: 'Livin by $titleChannel',
          steps: [
            'Buka aplikasi Livin by $titleChannel dan lakukan Login.',
            'Pilih menu "Bayar" atau "Transfer Virtual Account".',
            'Masukkan Nomor Virtual Account yang tertera di atas.',
            'Konfirmasi rincian tagihan dan selesaikan transaksi dengan PIN Anda.',
          ],
        ),
        const SizedBox(height: 8),
        _HowToPayTile(
          title: '$titleChannel ATM',
          steps: [
            'Masukkan Kartu ATM dan PIN $titleChannel Anda.',
            'Pilih menu "Bayar / Beli" -> pilih "Multipayment" atau "Virtual Account".',
            'Masukkan Kode Perusahaan / Kode Bank dan Nomor Virtual Account.',
            'Periksa jumlah tagihan dan tekan "YA" untuk membayar.',
          ],
        ),
        const SizedBox(height: 8),
        _HowToPayTile(
          title: 'Other Bank',
          steps: [
            'Buka Mobile Banking atau Internet Banking bank pilihan Anda.',
            'Pilih menu "Transfer ke Bank Lain" atau "Transfer antar Bank".',
            'Pilih Bank Tujuan ($titleChannel) dan masukkan Nomor Virtual Account.',
            'Masukkan nominal tagihan persis sesuai Total Amount to Pay.',
            'Ikuti instruksi hingga transaksi berhasil.',
          ],
        ),
      ],
    );
  }
}

class _HowToPayTile extends StatelessWidget {
  const _HowToPayTile({required this.title, required this.steps});
  final String title;
  final List<String> steps;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: const Color(0xFFEBEBEB),
      borderRadius: BorderRadius.circular(12),
    ),
    child: ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black87,
          fontSize: 14,
        ),
      ),
      iconColor: Colors.black87,
      collapsedIconColor: Colors.black54,
      childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      shape: const Border(),
      children: [
        for (int i = 0; i < steps.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${i + 1}. ',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                Expanded(
                  child: Text(
                    steps[i],
                    style: const TextStyle(fontSize: 13, height: 1.3),
                  ),
                ),
              ],
            ),
          ),
      ],
    ),
  );
}

class _SuccessCard extends StatelessWidget {
  const _SuccessCard({this.paidAt, required this.total});
  final String? paidAt;
  final int total;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: const Color(0xFFE8F5E9),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: const Color(0xFF4CAF50), width: 1.5),
    ),
    child: Column(
      children: [
        const Icon(
          Icons.check_circle_rounded,
          color: Color(0xFF2E7D32),
          size: 64,
        ),
        const SizedBox(height: 16),
        Text(
          'Pembayaran Berhasil!',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1B5E20),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Tagihan telah lunas dan diverifikasi oleh server.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: const Color(0xFF2E7D32),
          ),
        ),
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Total Dibayar:'),
            Text(
              CurrencyFormatter.rupiah(total),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B5E20),
              ),
            ),
          ],
        ),
        if (paidAt != null) ...[
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Waktu Lunas:'),
              Text(
                paidAt!,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ],
    ),
  );
}

class _FailedCard extends StatelessWidget {
  const _FailedCard({required this.status});
  final CheckoutPaymentStatus status;

  @override
  Widget build(BuildContext context) {
    final title = status == CheckoutPaymentStatus.expired
        ? 'Pembayaran Kedaluwarsa'
        : 'Pembayaran Gagal';
    final subtitle = status == CheckoutPaymentStatus.expired
        ? 'Waktu pembayaran telah habis. Silakan pilih kembali tagihan Anda.'
        : 'Transaksi tidak berhasil dikonfirmasi oleh gateway.';
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFFFEBEE),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFEF5350), width: 1.5),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.error_outline_rounded,
            color: Color(0xFFC62828),
            size: 64,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFFB71C1C),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: const Color(0xFFC62828),
            ),
          ),
        ],
      ),
    );
  }
}
