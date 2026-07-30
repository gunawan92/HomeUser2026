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

class ParentChildrenPaymentPage extends ConsumerWidget {
  const ParentChildrenPaymentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(paymentControllerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Pembayaran')),
      bottomSheet: state.selectedItems.isEmpty
          ? null
          : PaymentStickyCheckoutBar(
              items: state.selectedItems,
              isLoading: state.isPreparingCart,
              onContinue: () => _showSummary(context, ref),
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
              padding: EdgeInsets.fromLTRB(
                16,
                16,
                16,
                state.selectedItems.isEmpty ? 16 : 132,
              ),
              children: [
                Text(
                  'Pilih tagihan anak',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 6),
                Text(
                  'Pilih beberapa tagihan sebelum melihat ringkasan.',
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

  void _showSummary(BuildContext context, WidgetRef ref) {
    final state = ref.read(paymentControllerProvider);
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (sheetContext) => SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ringkasan pilihan',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              for (final item in state.selectedItems)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(item.title),
                  subtitle: Text(item.periode),
                  trailing: Text(CurrencyFormatter.rupiah(item.amount)),
                ),
              const Divider(),
              Text(
                'Subtotal ${CurrencyFormatter.rupiah(state.subtotal)}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () async {
                    Navigator.pop(sheetContext);
                    await ref
                        .read(paymentControllerProvider.notifier)
                        .prepareCart();
                    if (!context.mounted) return;
                    final next = ref.read(paymentControllerProvider);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          next.cartErrorMessage ??
                              (next.cartPreview == null
                                  ? 'Cart belum tersedia.'
                                  : 'Cart server berhasil dibuat.'),
                        ),
                      ),
                    );
                  },
                  child: const Text('Buat Keranjang'),
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
      child: PaymentTreeNode(
        level: 1,
        title: child.periodLabel,
        subtitle: '${child.availableCount} tagihan tersedia',
        leading: const Icon(Icons.calendar_month_outlined),
        expanded: true,
        onPressed: () {},
        child: PaymentTreeNode(
          level: 2,
          title: 'Kelas ${child.className}',
          leading: const Icon(Icons.school_outlined),
          expanded: true,
          onPressed: () {},
          child: Column(
            children: [
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
      level: 3,
      title: title,
      subtitle: '${items.length} tagihan',
      leading: Icon(
        type == PaymentType.spp
            ? Icons.receipt_long_outlined
            : Icons.account_balance_wallet_outlined,
      ),
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
