class CartItemModel {
  final String name;
  final String imageUrl;
  final double price;
  int quantity;

  CartItemModel({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });
}
