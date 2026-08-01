import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/currency_formatter.dart';
import '../../../../design_system/tokens/stela_colors.dart';
import '../../../../design_system/tokens/stela_spacing.dart';
import '../../application/payment_controller.dart';
import '../../domain/checkout_result.dart';
import '../../domain/payment_models.dart';
import '../widgets/payment_cart_bar.dart';
import '../widgets/payment_item_selectable_card.dart';
import '../widgets/payment_tree_node.dart';
import 'checkout_invoice_page.dart';
import 'payment_instruction_page.dart';

class ParentChildrenPaymentPage extends ConsumerStatefulWidget {
  const ParentChildrenPaymentPage({super.key});

  @override
  ConsumerState<ParentChildrenPaymentPage> createState() =>
      _ParentChildrenPaymentPageState();
}

class _ParentChildrenPaymentPageState
    extends ConsumerState<ParentChildrenPaymentPage> {
  int _activeTabIndex = 0; // 0: Tagihan, 1: Daftar Pembayaran, 2: Riwayat

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(paymentControllerProvider);
    final pendingCount =
        (state.checkoutResult != null || state.paymentAttempt != null) ? 1 : 0;

    return Scaffold(
      backgroundColor: const Color(0xFFFAF5EC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF5EC),
        elevation: 0,
        leading: IconButton(
          tooltip: 'Kembali',
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => context.canPop() ? context.pop() : context.go('/'),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pembayaran', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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
      bottomNavigationBar: _activeTabIndex == 0 && state.selectedItems.isNotEmpty
          ? PaymentStickyCheckoutBar(
              items: state.selectedItems,
              isLoading: state.isPreparingCart,
              onContinue: () => _continueWithCart(context, ref),
            )
          : null,
      body: Column(
        children: [
          const SizedBox(height: 6),
          _SegmentedTabBar(
            activeTab: _activeTabIndex,
            pendingCount: pendingCount,
            onTabSelected: (index) => setState(() => _activeTabIndex = index),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : state.errorMessage != null
                ? _ErrorView(
                    message: state.errorMessage!,
                    onRetry: () =>
                        ref.read(paymentControllerProvider.notifier).load(),
                  )
                : _buildTabBody(state),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBody(PaymentState state) {
    if (_activeTabIndex == 1) {
      return _DaftarPembayaranView(state: state);
    }
    if (_activeTabIndex == 2) {
      return _RiwayatView(state: state);
    }

    // Default Tab 0: Tagihan
    return ListView(
      padding: const EdgeInsets.fromLTRB(14, 4, 14, 20),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Text(
                'Perihal Pembayaran',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 14),
              for (final child in state.children)
                _StudentPaymentNode(child: child),
            ],
          ),
        ),
      ],
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
                  ? () {
                      final err = ref
                          .read(paymentControllerProvider.notifier)
                          .validateAndToggleItem(item);
                      if (err != null && context.mounted) {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(err),
                            backgroundColor: StelaColors.primaryRed,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    }
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

class _SegmentedTabBar extends StatelessWidget {
  const _SegmentedTabBar({
    required this.activeTab,
    required this.pendingCount,
    required this.onTabSelected,
  });
  final int activeTab;
  final int pendingCount;
  final ValueChanged<int> onTabSelected;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _PillTab(
          label: 'Tagihan',
          active: activeTab == 0,
          onTap: () => onTabSelected(0),
        ),
        const SizedBox(width: 8),
        _PillTab(
          label: 'Daftar Pembayaran',
          active: activeTab == 1,
          badgeCount: pendingCount,
          onTap: () => onTabSelected(1),
        ),
        const SizedBox(width: 8),
        _PillTab(
          label: 'Riwayat',
          active: activeTab == 2,
          onTap: () => onTabSelected(2),
        ),
      ],
    ),
  );
}

class _PillTab extends StatelessWidget {
  const _PillTab({
    required this.label,
    required this.active,
    required this.onTap,
    this.badgeCount = 0,
  });
  final String label;
  final bool active;
  final VoidCallback onTap;
  final int badgeCount;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(20),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: active ? StelaColors.primaryRed : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: active
                ? StelaColors.primaryRed.withValues(alpha: .3)
                : Colors.black.withValues(alpha: .06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              color: active ? Colors.white : Colors.black87,
              fontWeight: active ? FontWeight.bold : FontWeight.w600,
              fontSize: 13,
            ),
          ),
          if (badgeCount > 0) ...[
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: active ? Colors.white : StelaColors.primaryRed,
                shape: BoxShape.circle,
              ),
              child: Text(
                '$badgeCount',
                style: TextStyle(
                  color: active ? StelaColors.primaryRed : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ],
      ),
    ),
  );
}

class _DaftarPembayaranView extends StatelessWidget {
  const _DaftarPembayaranView({required this.state});
  final PaymentState state;

  PaymentAttempt? _resolveAttempt() {
    if (state.paymentAttempt != null) return state.paymentAttempt;
    final checkout = state.checkoutResult;
    if (checkout != null) {
      return PaymentAttempt(
        method: 'VIRTUAL_ACCOUNT',
        channel: 'Mandiri',
        subtotal: checkout.subtotal,
        adminFee: checkout.adminFee,
        grandTotal: checkout.grandTotal,
        virtualAccountNo: '8902296900001158',
        paymentStatus: checkout.paymentStatus,
        paidAt: checkout.paidAt,
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final checkout = state.checkoutResult;
    final attempt = _resolveAttempt();
    if (checkout == null && attempt == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.receipt_long_outlined, size: 56, color: Colors.black38),
              const SizedBox(height: 12),
              Text(
                'Belum Ada Daftar Pembayaran',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text(
                'Pembayaran yang sedang berjalan (Virtual Account / QRIS) akan muncul di sini.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54, fontSize: 13),
              ),
            ],
          ),
        ),
      );
    }

    final transid = checkout?.transidmerchant ?? 'ORDER-2026-08';
    final amount = attempt?.grandTotal ?? checkout?.grandTotal ?? 0;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: attempt != null
                ? () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => PaymentInstructionPage(attempt: attempt),
                      ),
                    );
                  }
                : null,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFFFB300), width: 1.5),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF8E1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFFFFB300)),
                        ),
                        child: const Text(
                          'Menunggu Pembayaran',
                          style: TextStyle(
                            color: Color(0xFFE65100),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        CurrencyFormatter.rupiah(amount),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: StelaColors.primaryRed,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text('ID Pembayaran: $transid', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  if (attempt != null) ...[
                    const SizedBox(height: 4),
                    Text('Metode: ${attempt.method} (${attempt.channel})', style: const TextStyle(color: Colors.black87, fontSize: 13)),
                  ],
                  const SizedBox(height: 16),
                  if (attempt != null)
                    FilledButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => PaymentInstructionPage(attempt: attempt),
                          ),
                        );
                      },
                      icon: const Icon(Icons.payment_rounded, size: 18),
                      label: const Text('Buka Instruksi Pembayaran'),
                      style: FilledButton.styleFrom(
                        minimumSize: const Size.fromHeight(46),
                        backgroundColor: StelaColors.primaryRed,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _RiwayatView extends StatelessWidget {
  const _RiwayatView({required this.state});
  final PaymentState state;

  @override
  Widget build(BuildContext context) {
    final paidItems = <PaymentItem>[];
    for (final child in state.children) {
      paidItems.addAll(child.items.where((i) => i.status == PaymentStatus.paid));
    }

    if (paidItems.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.history_rounded, size: 56, color: Colors.black38),
              const SizedBox(height: 12),
              Text(
                'Belum Ada Riwayat Pembayaran',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text(
                'Riwayat pembayaran lunas yang berhasil diverifikasi akan otomatis tersimpan di sini.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54, fontSize: 13),
              ),
            ],
          ),
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Riwayat Tagihan Lunas',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              for (final item in paidItems) ...[
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE0E0E0)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle_rounded, color: Color(0xFF2E7D32), size: 24),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                            const SizedBox(height: 2),
                            Text(CurrencyFormatter.rupiah(item.amount), style: const TextStyle(color: Color(0xFF2E7D32), fontWeight: FontWeight.bold, fontSize: 13)),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8F5E9),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFF4CAF50)),
                        ),
                        child: const Text(
                          'Lunas',
                          style: TextStyle(color: Color(0xFF2E7D32), fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
