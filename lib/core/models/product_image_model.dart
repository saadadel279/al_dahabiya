class ProductImage {
  final int? id;
  final String? image;

  ProductImage({this.id, this.image});

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      id: json['id'],
      image: json['image'],
    );
  }
}
