import '../../../../core/models/category_model.dart';
import '../../../../core/models/product_model.dart';

class SubCategoriesModel {
  int code;
  Data data;

  SubCategoriesModel({
    required this.code,
    required this.data,
  });

  // Factory constructor to parse the JSON
  factory SubCategoriesModel.fromJson(Map<String, dynamic> json) {
    return SubCategoriesModel(
      code: json['code'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  List<Category> categories;
  List<Product>? products;

  Data({
    required this.categories,
    this.products,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      categories: List<Category>.from(
          json['categories'].map((category) => Category.fromJson(category))),
      products: List<Product>.from(json['products']),
    );
  }

  // Method to convert the object back to JSON
}
