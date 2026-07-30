import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/currency_formatter.dart';
import '../../../../design_system/tokens/stela_colors.dart';
import '../../application/payment_controller.dart';
import '../../domain/cart_preview.dart';
import '../../domain/checkout_result.dart';
import '../../domain/payment_models.dart';
import 'payment_instruction_page.dart';

class CheckoutInvoicePage extends ConsumerStatefulWidget {
  const CheckoutInvoicePage({
    super.key,
    required this.checkout,
    required this.cart,
    required this.items,
  });

  final CheckoutResult checkout;
  final CartPreview cart;
  final List<PaymentItem> items;

  @override
  ConsumerState<CheckoutInvoicePage> createState() =>
      _CheckoutInvoicePageState();
}

class _CheckoutInvoicePageState extends ConsumerState<CheckoutInvoicePage> {
  late PaymentOption _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.checkout.paymentOptions.firstWhere(
      (option) => option.enabled,
      orElse: () => widget.checkout.paymentOptions.first,
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(paymentControllerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Pembayaran')),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
                children: [
                  _InvoiceCard(
                    items: widget.items,
                    subtotal: widget.checkout.subtotal,
                    adminFee: _selected.adminFee,
                    grandTotal: _selected.grandTotal,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Pilih Metode Pembayaran',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 12),
                  for (final option in widget.checkout.paymentOptions) ...[
                    _MethodOption(
                      option: option,
                      selected: _selected,
                      onChanged: option.enabled
                          ? () => setState(() => _selected = option)
                          : null,
                    ),
                    const SizedBox(height: 10),
                  ],
                  const SizedBox(height: 8),
                  Text(
                    'ID pembayaran: ${widget.checkout.transidmerchant}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: StelaColors.primaryRed,
                      ),
                      child: const Text('Batalkan'),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: FilledButton(
                      onPressed: _selected.enabled && !state.isRequestingPayment
                          ? _pay
                          : null,
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF16B84E),
                      ),
                      child: state.isRequestingPayment
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Bayar'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pay() async {
    final success = await ref
        .read(paymentControllerProvider.notifier)
        .createPayment(_selected);
    if (!mounted) return;
    final state = ref.read(paymentControllerProvider);
    if (!success || state.paymentAttempt == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.cartErrorMessage ?? 'Pembayaran gagal dibuat.'),
        ),
      );
      return;
    }
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => PaymentInstructionPage(attempt: state.paymentAttempt!),
      ),
    );
  }
}

class _InvoiceCard extends StatelessWidget {
  const _InvoiceCard({
    required this.items,
    required this.subtotal,
    required this.adminFee,
    required this.grandTotal,
  });
  final List<PaymentItem> items;
  final int subtotal;
  final int adminFee;
  final int grandTotal;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      color: const Color(0xFFFFF3DC),
      borderRadius: BorderRadius.circular(18),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  'Ringkasan Tagihan',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 4),
                const Text('yang akan dibayarkan'),
              ],
            ),
          ),
          const SizedBox(height: 18),
          for (final item in items)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: _InvoiceItem(item: item),
            ),
          const Divider(height: 30),
          _AmountLine(label: 'Sub Total', amount: subtotal),
          const SizedBox(height: 8),
          _AmountLine(label: 'Biaya Admin', amount: adminFee),
          const Divider(height: 30),
          _AmountLine(label: 'Total', amount: grandTotal, emphasized: true),
        ],
      ),
    ),
  );
}

class _InvoiceItem extends StatelessWidget {
  const _InvoiceItem({required this.item});
  final PaymentItem item;
  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      color: const Color(0xFFDADADA),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        children: [
          Expanded(child: Text(item.title)),
          Text(CurrencyFormatter.rupiah(item.amount)),
        ],
      ),
    ),
  );
}

class _AmountLine extends StatelessWidget {
  const _AmountLine({
    required this.label,
    required this.amount,
    this.emphasized = false,
  });
  final String label;
  final int amount;
  final bool emphasized;
  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(
        child: Text(
          label,
          style: TextStyle(
            fontWeight: emphasized ? FontWeight.w700 : FontWeight.w600,
          ),
        ),
      ),
      Text(
        CurrencyFormatter.rupiah(amount),
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: emphasized ? StelaColors.primaryRed : null,
        ),
      ),
    ],
  );
}

class _MethodOption extends StatelessWidget {
  const _MethodOption({
    required this.option,
    required this.selected,
    this.onChanged,
  });
  final PaymentOption option;
  final PaymentOption selected;
  final VoidCallback? onChanged;
  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onChanged,
    borderRadius: BorderRadius.circular(12),
    child: Opacity(
      opacity: option.enabled ? 1 : .5,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black87),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(option.label),
                  if (!option.enabled && option.disabledReason != null)
                    Text(
                      option.disabledReason!,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                ],
              ),
            ),
            Icon(
              selected.channel == option.channel
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
            ),
          ],
        ),
      ),
    ),
  );
}
