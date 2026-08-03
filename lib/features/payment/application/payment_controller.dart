import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

import '../../authentication/application/auth_controller.dart';
import '../data/api_payment_repository.dart';
import '../data/cart_repository.dart';
import '../domain/cart_preview.dart';
import '../domain/checkout_result.dart';
import '../domain/payment_models.dart';
import '../domain/payment_repository.dart';

final paymentRepositoryProvider = Provider<PaymentRepository>((ref) {
  final session = ref.watch(authSessionProvider);
  if (session == null) {
    throw StateError('Silakan masuk kembali untuk memuat tagihan.');
  }
  return ApiPaymentRepository(
    ref.read(apiClientProvider),
    session.parentReference,
  );
});

final paymentControllerProvider =
    NotifierProvider<PaymentController, PaymentState>(PaymentController.new);
final cartRepositoryProvider = Provider<CartRepository>(
  (ref) => CartRepository(ref.read(apiClientProvider)),
);

class PaymentState {
  const PaymentState({
    this.children = const [],
    this.selectedItems = const [],
    this.expandedChildSerial,
    this.expandedCategoryKeys = const {},
    this.isLoading = false,
    this.errorMessage,
    this.isPreparingCart = false,
    this.cartPreview,
    this.cartErrorMessage,
    this.isCheckingOut = false,
    this.checkoutResult,
    this.isRequestingPayment = false,
    this.paymentAttempt,
    this.paymentStatus = CheckoutPaymentStatus.pending,
    this.isPollingStatus = false,
    this.paidAt,
  });

  final List<ChildPaymentProfile> children;
  final List<PaymentItem> selectedItems;
  final String? expandedChildSerial;
  final Set<String> expandedCategoryKeys;
  final bool isLoading;
  final String? errorMessage;
  final bool isPreparingCart;
  final CartPreview? cartPreview;
  final String? cartErrorMessage;
  final bool isCheckingOut;
  final CheckoutResult? checkoutResult;
  final bool isRequestingPayment;
  final PaymentAttempt? paymentAttempt;
  final CheckoutPaymentStatus paymentStatus;
  final bool isPollingStatus;
  final String? paidAt;

  int get subtotal => selectedItems.fold(0, (sum, item) => sum + item.amount);

  PaymentState copyWith({
    List<ChildPaymentProfile>? children,
    List<PaymentItem>? selectedItems,
    String? expandedChildSerial,
    Set<String>? expandedCategoryKeys,
    bool clearExpandedChild = false,
    bool? isLoading,
    String? errorMessage,
    bool? isPreparingCart,
    CartPreview? cartPreview,
    bool clearCartPreview = false,
    String? cartErrorMessage,
    bool? isCheckingOut,
    CheckoutResult? checkoutResult,
    bool? isRequestingPayment,
    PaymentAttempt? paymentAttempt,
    CheckoutPaymentStatus? paymentStatus,
    bool? isPollingStatus,
    String? paidAt,
  }) => PaymentState(
    children: children ?? this.children,
    selectedItems: selectedItems ?? this.selectedItems,
    expandedChildSerial: clearExpandedChild
        ? null
        : expandedChildSerial ?? this.expandedChildSerial,
    expandedCategoryKeys: expandedCategoryKeys ?? this.expandedCategoryKeys,
    isLoading: isLoading ?? this.isLoading,
    errorMessage: errorMessage,
    isPreparingCart: isPreparingCart ?? this.isPreparingCart,
    cartPreview: clearCartPreview ? null : cartPreview ?? this.cartPreview,
    cartErrorMessage: cartErrorMessage,
    isCheckingOut: isCheckingOut ?? this.isCheckingOut,
    checkoutResult: checkoutResult ?? this.checkoutResult,
    isRequestingPayment: isRequestingPayment ?? this.isRequestingPayment,
    paymentAttempt: paymentAttempt ?? this.paymentAttempt,
    paymentStatus: paymentStatus ?? this.paymentStatus,
    isPollingStatus: isPollingStatus ?? this.isPollingStatus,
    paidAt: paidAt ?? this.paidAt,
  );
}

class PaymentController extends Notifier<PaymentState> {
  @override
  PaymentState build() {
    Future<void>.microtask(load);
    return const PaymentState(isLoading: true);
  }

  Future<void> load() async {
    try {
      final children = await ref
          .read(paymentRepositoryProvider)
          .getChildrenPayments();
      state = state.copyWith(children: children, isLoading: false);
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: _userFacingError(error),
      );
    }
  }

  void toggleChild(String serial) => state = state.copyWith(
    expandedChildSerial: state.expandedChildSerial == serial ? null : serial,
    clearExpandedChild: state.expandedChildSerial == serial,
  );

  String? validateAndToggleItem(PaymentItem item) {
    final alreadySelected = state.selectedItems.any(
      (selected) => selected.selectionKey == item.selectionKey,
    );

    if (item.jenisPembayaran == PaymentType.spp) {
      final childProfile = state.children.firstWhere(
        (c) => c.serial == item.serial,
        orElse: () => ChildPaymentProfile(
          idschool: '',
          serial: '',
          name: '',
          schoolName: '',
          periodLabel: '',
          periodReference: '',
          className: '',
          idclass: '',
          items: const [],
        ),
      );

      final availableSppItems = childProfile.items
          .where((i) => i.jenisPembayaran == PaymentType.spp && i.isSelectable)
          .toList();

      final itemIndex = availableSppItems.indexWhere(
        (i) => i.selectionKey == item.selectionKey,
      );

      if (!alreadySelected && itemIndex > 0) {
        for (int i = 0; i < itemIndex; i++) {
          final earlier = availableSppItems[i];
          final earlierSelected = state.selectedItems.any(
            (s) => s.selectionKey == earlier.selectionKey,
          );
          if (!earlierSelected) {
            return 'Pembayaran SPP lebih dari 1 bulan harus berurutan. Silakan pilih tagihan bulan sebelumnya (${earlier.title}) terlebih dahulu.';
          }
        }
      } else if (alreadySelected && itemIndex >= 0) {
        final selectedKeysToRemove = <String>{item.selectionKey};
        for (int i = itemIndex + 1; i < availableSppItems.length; i++) {
          selectedKeysToRemove.add(availableSppItems[i].selectionKey);
        }
        state = state.copyWith(
          clearCartPreview: true,
          selectedItems: state.selectedItems
              .where((s) => !selectedKeysToRemove.contains(s.selectionKey))
              .toList(growable: false),
        );
        return null;
      }
    }

    state = state.copyWith(
      clearCartPreview: true,
      selectedItems: alreadySelected
          ? state.selectedItems
                .where((selected) => selected.selectionKey != item.selectionKey)
                .toList(growable: false)
          : [...state.selectedItems, item],
    );
    return null;
  }

  void toggleItem(PaymentItem item) {
    validateAndToggleItem(item);
  }

  void toggleCategory(String key) {
    final expanded = {...state.expandedCategoryKeys};
    expanded.contains(key) ? expanded.remove(key) : expanded.add(key);
    state = state.copyWith(expandedCategoryKeys: expanded);
  }

  void removeItem(PaymentItem item) => state = state.copyWith(
    clearCartPreview: true,
    selectedItems: state.selectedItems
        .where((selected) => selected.selectionKey != item.selectionKey)
        .toList(growable: false),
  );

  Future<void> prepareCart() async {
    if (state.selectedItems.isEmpty) return;
    final session = ref.read(authSessionProvider);
    if (session == null) {
      state = state.copyWith(cartErrorMessage: 'Sesi login tidak tersedia.');
      return;
    }
    if (state.selectedItems.any((item) => item.referenceTambahan == null)) {
      state = state.copyWith(
        cartErrorMessage:
            'Metadata wajib `source_reference` tidak tersedia untuk salah satu tagihan.',
      );
      return;
    }
    state = state.copyWith(isPreparingCart: true, cartErrorMessage: null);
    try {
      final preview = await ref
          .read(cartRepositoryProvider)
          .prepareCart(
            parentReference: session.parentReference,
            items: state.selectedItems,
          );
      state = state.copyWith(isPreparingCart: false, cartPreview: preview);
    } catch (error) {
      state = state.copyWith(
        isPreparingCart: false,
        cartErrorMessage: _userFacingError(error),
      );
    }
  }

  Future<bool> checkoutCart() async {
    final preview = state.cartPreview;
    final session = ref.read(authSessionProvider);
    if (preview == null || session == null) {
      state = state.copyWith(
        cartErrorMessage: 'Cart server atau sesi login tidak tersedia.',
      );
      return false;
    }
    state = state.copyWith(isCheckingOut: true, cartErrorMessage: null);
    try {
      final result = await ref
          .read(cartRepositoryProvider)
          .checkoutCart(
            cartReference: preview.cartReference,
            parentReference: session.parentReference,
          );
      state = state.copyWith(isCheckingOut: false, checkoutResult: result);
      return true;
    } catch (error) {
      state = state.copyWith(
        isCheckingOut: false,
        cartErrorMessage: _userFacingError(error),
      );
      return false;
    }
  }

  Future<bool> createPayment(PaymentOption option) async {
    final checkout = state.checkoutResult;
    if (checkout == null) {
      state = state.copyWith(cartErrorMessage: 'Checkout belum tersedia.');
      return false;
    }
    if (!option.enabled) {
      state = state.copyWith(
        cartErrorMessage:
            option.disabledReason ?? 'Kanal pembayaran tidak tersedia.',
      );
      return false;
    }
    state = state.copyWith(isRequestingPayment: true, cartErrorMessage: null);
    try {
      final attempt = await ref
          .read(cartRepositoryProvider)
          .createPayment(
            transidmerchant: checkout.transidmerchant,
            option: option,
          );
      state = state.copyWith(
        isRequestingPayment: false,
        paymentAttempt: attempt,
        paymentStatus: CheckoutPaymentStatus.paymentRequested,
      );
      return true;
    } catch (error) {
      state = state.copyWith(
        isRequestingPayment: false,
        cartErrorMessage: _userFacingError(error),
      );
      return false;
    }
  }

  Future<CheckoutPaymentStatus> checkPaymentStatus(String transidmerchant) async {
    state = state.copyWith(isPollingStatus: true);
    try {
      final summary = await ref
          .read(cartRepositoryProvider)
          .getCheckoutSummary(transidmerchant);
      final newStatus = summary.paymentStatus;
      final attempt = state.paymentAttempt?.copyWithStatus(
        paymentStatus: newStatus,
        callbackReceived: summary.callbackReceived,
        paidAt: summary.paidAt,
      );
      final updatedCheckout = state.checkoutResult == null
          ? null
          : CheckoutResult(
              transidmerchant: summary.transidmerchant,
              transidstela: summary.transidstela,
              subtotal: summary.subtotal,
              adminFee: summary.adminFee,
              grandTotal: summary.grandTotal,
              paymentOptions: summary.paymentOptions,
              transactions: summary.transactions,
              paymentStatus: newStatus,
              callbackReceived: summary.callbackReceived,
              paidAt: summary.paidAt,
            );
      state = state.copyWith(
        isPollingStatus: false,
        checkoutResult: updatedCheckout,
        paymentAttempt: attempt,
        paymentStatus: newStatus,
        paidAt: summary.paidAt,
      );
      if (newStatus == CheckoutPaymentStatus.paid) {
        // Auto-refresh children bills so paid items are updated to status: PAID
        await load();
        state = state.copyWith(selectedItems: const []);
      }
      return newStatus;
    } catch (_) {
      state = state.copyWith(isPollingStatus: false);
      return state.paymentStatus;
    }
  }

  String _userFacingError(Object error) {
    if (error is DioException) {
      final response = error.response;
      final data = response?.data;
      if (data is Map) {
        final message = data['message'] ?? data['error'] ?? data['errors'];
        final text = message?.toString().trim();
        if (text != null && text.isNotEmpty) return text;
      }
      return switch (response?.statusCode) {
        400 =>
          'Data pembayaran belum dapat diproses. Periksa tagihan lalu coba lagi.',
        401 || 403 => 'Sesi Anda telah berakhir. Silakan masuk kembali.',
        404 => 'Data pembayaran tidak ditemukan.',
        409 =>
          'Data pembayaran sedang diproses. Silakan buka kembali instruksinya.',
        _ =>
          'Layanan pembayaran sedang tidak dapat dihubungi. Coba lagi nanti.',
      };
    }
    return error.toString();
  }
}
