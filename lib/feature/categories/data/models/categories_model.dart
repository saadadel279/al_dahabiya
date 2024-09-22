class CategoriesModel {
  int? code;
  List<Category>? data;

  CategoriesModel({this.code, this.data});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      code: json['code'],
      data: json['data'] != null
          ? List<Category>.from(json['data']
              .map((categoryJson) => Category.fromJson(categoryJson)))
          : null,
    );
  }
}

class Category {
  int? id;
  String name;
  String? image;
  int? inHomePage;

  Category({this.id, required this.name, this.image, this.inHomePage});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      inHomePage: json['in_home_page'],
    );
  }
}
