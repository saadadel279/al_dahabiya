import '../../../../core/models/product_model.dart';

class MostVisitedModel {
  final int code;
  final List<Product> data;

  MostVisitedModel({
    required this.code,
    required this.data,
  });

  factory MostVisitedModel.fromJson(Map<String, dynamic> json) {
    return MostVisitedModel(
      code: json['code'],
      data: List<Product>.from(
          json['data'].map((item) => Product.fromJson(item))),
    );
  }
}
