class CategoriesModel {
  int code;
  List<Category> data;

  CategoriesModel({
    required this.code,
    required this.data,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      code: json['code'],
      data: List<Category>.from(
          json['data'].map((category) => Category.fromJson(category))),
    );
  }
}

class Category {
  int id;
  String name;
  String image;
  int inHomePage;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.inHomePage,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      inHomePage: json['in_home_page'],
    );
  }
}
