import 'package:al_dahabiya/core/models/product_model.dart';

class SearchModel {
  final int code;
  final List<Product> data;

  SearchModel({
    required this.code,
    required this.data,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      code: json['code'],
      data: List<Product>.from(
          json['data'].map((item) => Product.fromJson(item))),
    );
  }
}
