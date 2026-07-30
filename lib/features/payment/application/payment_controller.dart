import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      state = state.copyWith(isLoading: false, errorMessage: error.toString());
    }
  }

  void toggleChild(String serial) => state = state.copyWith(
    expandedChildSerial: state.expandedChildSerial == serial ? null : serial,
    clearExpandedChild: state.expandedChildSerial == serial,
  );

  void toggleItem(PaymentItem item) {
    final alreadySelected = state.selectedItems.any(
      (selected) => selected.selectionKey == item.selectionKey,
    );
    state = state.copyWith(
      clearCartPreview: true,
      selectedItems: alreadySelected
          ? state.selectedItems
                .where((selected) => selected.selectionKey != item.selectionKey)
                .toList(growable: false)
          : [...state.selectedItems, item],
    );
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
        cartErrorMessage: error.toString(),
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
        cartErrorMessage: error.toString(),
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
      );
      return true;
    } catch (error) {
      state = state.copyWith(
        isRequestingPayment: false,
        cartErrorMessage: error.toString(),
      );
      return false;
    }
  }
}
