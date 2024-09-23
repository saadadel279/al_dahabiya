import 'package:al_dahabiya/core/models/atributes.dart';
import 'package:al_dahabiya/core/models/category_model.dart';
import 'package:al_dahabiya/core/models/product_image_model.dart';

class Product {
  final int? id;
  final String? name;
  final String? image;
  final String? type;
  final int? quantity;
  final int? price;
  final String? currency;
  final bool? hasDiscount;
  final int? discountPrice;
  final int? review;
  final int? status;
  final bool? isFavourite;
  final String? desc;
  final String? quality;
  final Category? category;
  final dynamic option;
  final List<ProductImage>? images;
  final List<Attribute>? attributes;
  final List<dynamic>? discounts;
  final List<dynamic>? reviews;

  Product({
    this.id,
    this.name,
    this.image,
    this.type,
    this.quantity,
    this.price,
    this.currency,
    this.hasDiscount,
    this.discountPrice,
    this.review,
    this.status,
    this.isFavourite,
    this.desc,
    this.quality,
    this.category,
    this.option,
    this.images,
    this.attributes,
    this.discounts,
    this.reviews,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] is int ? json['id'] : int.tryParse(json['id'].toString()),
      name: json['name'],
      image: json['image'],
      type: json['type'],
      quantity: json['quantity'] is int
          ? json['quantity']
          : int.tryParse(json['quantity'].toString()),
      price: json['price'] is int
          ? json['price']
          : int.tryParse(json['price'].toString()),
      currency: json['currency'],
      hasDiscount: json['has_discount'] is bool
          ? json['has_discount']
          : json['has_discount'] == 'true',
      discountPrice: json['discount_price'] is int
          ? json['discount_price']
          : int.tryParse(json['discount_price'].toString()),
      review: json['review'] is int
          ? json['review']
          : int.tryParse(json['review'].toString()),
      status: json['status'] is int
          ? json['status']
          : int.tryParse(json['status'].toString()),
      isFavourite: json['is_favourite'] is bool
          ? json['is_favourite']
          : json['is_favourite'] == 'true',
      desc: json['desc'],
      quality: json['quality'],
      category:
          json['category'] != null ? Category.fromJson(json['category']) : null,
      option: json['option'],
      images: (json['images'] as List<dynamic>?)
          ?.map((item) => ProductImage.fromJson(item))
          .toList(),
      attributes: (json['attributes'] as List<dynamic>?)
          ?.map((item) => Attribute.fromJson(item))
          .toList(),
      discounts: json['discounts'] as List<dynamic>?,
      reviews: json['reviews'] as List<dynamic>?,
    );
  }
}
