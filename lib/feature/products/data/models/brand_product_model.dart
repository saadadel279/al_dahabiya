class BrandProductsModel {
  final int? code;
  final List<ProductOfBrand>? data;

  BrandProductsModel({this.code, this.data});

  factory BrandProductsModel.fromJson(Map<String, dynamic> json) {
    return BrandProductsModel(
      code: json['code'],
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => ProductOfBrand.fromJson(item))
          .toList(),
    );
  }
}

class ProductOfBrand {
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

  ProductOfBrand({
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

  factory ProductOfBrand.fromJson(Map<String, dynamic> json) {
    return ProductOfBrand(
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

class Category {
  final int? id;
  final String? name;
  final String? image;
  final int? inHomePage;

  Category({this.id, this.name, this.image, this.inHomePage});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      inHomePage: json['in_home_page'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'in_home_page': inHomePage,
    };
  }
}

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

class Attribute {
  final int? id;
  final String? name;
  final String? value;

  Attribute({this.id, this.name, this.value});

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      id: json['id'],
      name: json['name'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'value': value,
    };
  }
}
