import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/currency_formatter.dart';
import '../../../../design_system/tokens/stela_colors.dart';
import '../../../../design_system/tokens/stela_spacing.dart';
import '../../application/payment_controller.dart';
import '../../domain/payment_models.dart';
import '../widgets/payment_cart_bar.dart';
import '../widgets/payment_item_selectable_card.dart';
import '../widgets/payment_tree_node.dart';
import 'checkout_invoice_page.dart';

class ParentChildrenPaymentPage extends ConsumerWidget {
  const ParentChildrenPaymentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(paymentControllerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Pembayaran')),
      bottomNavigationBar: state.selectedItems.isEmpty
          ? null
          : PaymentStickyCheckoutBar(
              items: state.selectedItems,
              isLoading: state.isPreparingCart,
              onContinue: () => _continueWithCart(context, ref),
            ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.errorMessage != null
          ? _ErrorView(
              message: state.errorMessage!,
              onRetry: () =>
                  ref.read(paymentControllerProvider.notifier).load(),
            )
          : ListView(
              padding: const EdgeInsets.all(StelaSpacing.md),
              children: [
                Text(
                  'Pilih tagihan anak',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 6),
                Text(
                  'Pilih tagihan yang ingin dibayar.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: StelaColors.textSecondary,
                  ),
                ),
                const SizedBox(height: StelaSpacing.lg),
                for (final child in state.children)
                  _StudentPaymentNode(child: child),
              ],
            ),
    );
  }

  Future<void> _continueWithCart(BuildContext context, WidgetRef ref) async {
    await ref.read(paymentControllerProvider.notifier).prepareCart();
    if (!context.mounted) return;
    final next = ref.read(paymentControllerProvider);
    if (next.cartPreview == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(next.cartErrorMessage ?? 'Cart belum tersedia.'),
        ),
      );
      return;
    }
    _showServerCart(context, ref);
  }

  void _showServerCart(BuildContext context, WidgetRef ref) {
    final state = ref.read(paymentControllerProvider);
    final cart = state.cartPreview!;
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (sheetContext) => SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Keranjang siap',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                '${state.selectedItems.length} Tagihan siap untuk dibayar ya ibu/bapak.',
              ),
              const SizedBox(height: 16),
              Text(
                'Total ${CurrencyFormatter.rupiah(cart.grandTotal)}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () async {
                    await ref
                        .read(paymentControllerProvider.notifier)
                        .checkoutCart();
                    if (!context.mounted) return;
                    final next = ref.read(paymentControllerProvider);
                    if (next.checkoutResult == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            next.cartErrorMessage ?? 'Checkout belum berhasil.',
                          ),
                        ),
                      );
                      return;
                    }
                    if (sheetContext.mounted) Navigator.pop(sheetContext);
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => CheckoutInvoicePage(
                          checkout: next.checkoutResult!,
                          cart: cart,
                          items: next.selectedItems,
                        ),
                      ),
                    );
                  },
                  child: const Text('Lanjut Checkout'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StudentPaymentNode extends ConsumerWidget {
  const _StudentPaymentNode({required this.child});
  final ChildPaymentProfile child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(paymentControllerProvider);
    final open = state.expandedChildSerial == child.serial;
    return PaymentTreeNode(
      level: 0,
      title: child.name,
      subtitle: '${child.schoolName} - ${child.className}',
      leading: CircleAvatar(child: Text(child.name.substring(0, 1))),
      trailing: Text(
        '${child.availableCount} tagihan',
        style: Theme.of(context).textTheme.bodySmall,
      ),
      expanded: open,
      onPressed: () => ref
          .read(paymentControllerProvider.notifier)
          .toggleChild(child.serial),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, top: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_month_outlined, size: 18),
                const SizedBox(width: 8),
                Text(
                  child.periodLabel,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(width: 8),
                Text(
                  '• ${child.availableCount} tagihan',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: StelaColors.textSecondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  const Icon(Icons.school_outlined, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    'Kelas ${child.className}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            _CategoryNode(
              childSerial: child.serial,
              title: 'Pembayaran SPP',
              type: PaymentType.spp,
              items: child.items
                  .where((item) => item.jenisPembayaran == PaymentType.spp)
                  .toList(),
            ),
            _CategoryNode(
              childSerial: child.serial,
              title: 'Pembayaran Lainnya',
              type: PaymentType.other,
              items: child.items
                  .where((item) => item.jenisPembayaran == PaymentType.other)
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryNode extends ConsumerWidget {
  const _CategoryNode({
    required this.childSerial,
    required this.title,
    required this.type,
    required this.items,
  });
  final String childSerial;
  final String title;
  final PaymentType type;
  final List<PaymentItem> items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(paymentControllerProvider);
    final key = '$childSerial-${type.name}';
    final open = state.expandedCategoryKeys.contains(key);
    return PaymentTreeNode(
      level: 1,
      title: title,
      subtitle: '${items.length} tagihan',
      leading: Icon(
        type == PaymentType.spp
            ? Icons.receipt_long_outlined
            : Icons.account_balance_wallet_outlined,
      ),
      headerColor: type == PaymentType.spp ? StelaColors.primaryRed : null,
      expanded: open,
      onPressed: () =>
          ref.read(paymentControllerProvider.notifier).toggleCategory(key),
      child: Column(
        children: [
          if (items.isEmpty)
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text('Belum ada tagihan.'),
            ),
          for (final item in items) ...[
            PaymentItemSelectableCard(
              item: item,
              isSelected: state.selectedItems.any(
                (selected) => selected.selectionKey == item.selectionKey,
              ),
              onTap: item.isSelectable
                  ? () => ref
                        .read(paymentControllerProvider.notifier)
                        .toggleItem(item)
                  : null,
            ),
            const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});
  final String message;
  final VoidCallback onRetry;
  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message, textAlign: TextAlign.center),
          const SizedBox(height: 12),
          OutlinedButton(onPressed: onRetry, child: const Text('Coba Lagi')),
        ],
      ),
    ),
  );
}
