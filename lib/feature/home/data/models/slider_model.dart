class SliderModel {
  final int code;
  final List<SliderData> data;

  SliderModel({
    required this.code,
    required this.data,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      code: json['code'],
      data: (json['data'] as List)
          .map((item) => SliderData.fromJson(item))
          .toList(),
    );
  }
}

class SliderData {
  final int id;
  final String? link;
  final String image;

  SliderData({
    required this.id,
    this.link,
    required this.image,
  });

  factory SliderData.fromJson(Map<String, dynamic> json) {
    return SliderData(
      id: json['id'],
      link: json['link'],
      image: json['image'],
    );
  }
}
