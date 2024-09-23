import 'package:al_dahabiya/core/models/category_model.dart';

class CategoryResponseModel {
  int code;
  List<Category> data;

  CategoryResponseModel({
    required this.code,
    required this.data,
  });

  // Factory constructor to parse the JSON
  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoryResponseModel(
      code: json['code'],
      data: List<Category>.from(
          json['data'].map((category) => Category.fromJson(category))),
    );
  }

  // Method to convert the object back to JSON
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'data': data.map((category) => category.toJson()).toList(),
    };
  }
}
