class CategoryProductModel {
  int? code;
  List<CategoryProduct>? data;

  CategoryProductModel({this.code, this.data});

  // Factory method to create ProductModel from JSON
  factory CategoryProductModel.fromJson(Map<String, dynamic> json) {
    return CategoryProductModel(
      code: json['code'],
      data: json['data'] != null
          ? List<CategoryProduct>.from(
              json['data'].map((product) => CategoryProduct.fromJson(product)))
          : null,
    );
  }

  // Convert ProductModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'data': data?.map((product) => product.toJson()).toList(),
    };
  }
}

class CategoryProduct {
  int? id;
  String? name;
  String? image;
  String? type;
  int? quantity;
  double? price;
  String? currency;
  bool? hasDiscount;
  double? discountPrice;
  double? review;
  int? status;
  bool? isFavourite;
  String? desc;
  String? quality;
  Category? category;
  dynamic option; // Can handle future types if 'option' is null or unknown
  List<ProductImage>? images;
  List<Attribute>? attributes;
  List<dynamic>? discounts;
  List<dynamic>? reviews;

  CategoryProduct({
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

  // Factory method to create Product from JSON
  factory CategoryProduct.fromJson(Map<String, dynamic> json) {
    return CategoryProduct(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      type: json['type'],
      quantity: json['quantity'],
      price: (json['price'] as num).toDouble(),
      currency: json['currency'],
      hasDiscount: json['has_discount'],
      discountPrice: (json['discount_price'] as num).toDouble(),
      review: (json['review'] as num).toDouble(),
      status: json['status'],
      isFavourite: json['is_favourite'],
      desc: json['desc'],
      quality: json['quality'],
      category:
          json['category'] != null ? Category.fromJson(json['category']) : null,
      option: json['option'],
      images: json['images'] != null
          ? List<ProductImage>.from(
              json['images'].map((image) => ProductImage.fromJson(image)))
          : null,
      attributes: json['attributes'] != null
          ? List<Attribute>.from(json['attributes']
              .map((attribute) => Attribute.fromJson(attribute)))
          : null,
      discounts: json['discounts'] != null
          ? List<dynamic>.from(json['discounts'])
          : [],
      reviews:
          json['reviews'] != null ? List<dynamic>.from(json['reviews']) : [],
    );
  }

  // Convert Product to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'type': type,
      'quantity': quantity,
      'price': price,
      'currency': currency,
      'has_discount': hasDiscount,
      'discount_price': discountPrice,
      'review': review,
      'status': status,
      'is_favourite': isFavourite,
      'desc': desc,
      'quality': quality,
      'category': category?.toJson(),
      'option': option,
      'images': images?.map((image) => image.toJson()).toList(),
      'attributes': attributes?.map((attribute) => attribute.toJson()).toList(),
      'discounts': discounts,
      'reviews': reviews,
    };
  }
}

class Category {
  int? id;
  String? name;
  String? image;
  int? inHomePage;

  Category({this.id, this.name, this.image, this.inHomePage});

  // Factory method to create Category from JSON
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      inHomePage: json['in_home_page'],
    );
  }

  // Convert Category to JSON
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
  int? id;
  String? image;

  ProductImage({this.id, this.image});

  // Factory method to create ProductImage from JSON
  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      id: json['id'],
      image: json['image'],
    );
  }

  // Convert ProductImage to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
    };
  }
}

class Attribute {
  int? id;
  String? name;
  String? value;

  Attribute({this.id, this.name, this.value});

  // Factory method to create Attribute from JSON
  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      id: json['id'],
      name: json['name'],
      value: json['value'],
    );
  }

  // Convert Attribute to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'value': value,
    };
  }
}
