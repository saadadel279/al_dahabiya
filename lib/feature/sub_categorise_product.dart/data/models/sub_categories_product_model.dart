import 'package:al_dahabiya/core/models/product_model.dart';

class SubCategoriesProductModel {
  final int code;
  final List<Product> data;

  SubCategoriesProductModel({
    required this.code,
    required this.data,
  });

  factory SubCategoriesProductModel.fromJson(Map<String, dynamic> json) {
    return SubCategoriesProductModel(
      code: json['code'],
      data:
          (json['data'] as List).map((item) => Product.fromJson(item)).toList(),
    );
  }
}
