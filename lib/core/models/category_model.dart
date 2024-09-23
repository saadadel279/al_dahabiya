class Category {
  final int? id;
  final String? name;
  final String? image;
  final int? inHomePage;

  Category({this.id, this.name, this.image, this.inHomePage});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      inHomePage: json['in_home_page'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'in_home_page': inHomePage,
    };
  }
}
