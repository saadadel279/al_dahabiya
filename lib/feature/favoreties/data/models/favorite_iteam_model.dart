class FavoritItemModel {
  final int id;
  final String name;
  final String imageUrl;
  final double price;

  FavoritItemModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
  });
  factory FavoritItemModel.fromJson(Map<String, dynamic> json) {
    return FavoritItemModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown Product',
      imageUrl: json['imageUrl'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
    );
  }
}
