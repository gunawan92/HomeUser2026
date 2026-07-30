class CartPreview {
  const CartPreview({
    required this.cartReference,
    required this.subtotal,
    required this.adminFee,
    required this.grandTotal,
  });

  final String cartReference;
  final int subtotal;
  final int adminFee;
  final int grandTotal;
}
