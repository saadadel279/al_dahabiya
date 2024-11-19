import 'package:al_dahabiya/core/models/product_model.dart';

class FilteredProductModel {
  final int code;
  final List<Product> data;

  FilteredProductModel({
    required this.code,
    required this.data,
  });

  factory FilteredProductModel.fromJson(Map<String, dynamic> json) {
    return FilteredProductModel(
      code: json['code'],
      data: List<Product>.from(
          json['data'].map((item) => Product.fromJson(item))),
    );
  }
}
