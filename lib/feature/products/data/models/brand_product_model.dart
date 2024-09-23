import 'package:al_dahabiya/core/models/product_model.dart';

class BrandProductsModel {
  final int? code;
  final List<Product>? data;

  BrandProductsModel({this.code, this.data});

  factory BrandProductsModel.fromJson(Map<String, dynamic> json) {
    return BrandProductsModel(
      code: json['code'],
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => Product.fromJson(item))
          .toList(),
    );
  }
}
