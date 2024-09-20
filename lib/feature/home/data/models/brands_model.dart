class BrandsModel {
  int code;
  List<Brand> data;

  BrandsModel({
    required this.code,
    required this.data,
  });

  factory BrandsModel.fromJson(Map<String, dynamic> json) {
    return BrandsModel(
      code: json['code'],
      data: List<Brand>.from(
          json['data'].map((category) => Brand.fromJson(category))),
    );
  }
}

class Brand {
  int id;
  String name;
  String image;

  Brand({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
