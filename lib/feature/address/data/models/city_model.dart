class CityModel {
  final int code;
  final List<CityData> data;

  CityModel({
    required this.code,
    required this.data,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      code: json['code'],
      data: List<CityData>.from(
          json['data'].map((city) => CityData.fromJson(city))),
    );
  }
}

class CityData {
  final int id;
  final String name;
  final int shippingCost;

  CityData({
    required this.id,
    required this.name,
    required this.shippingCost,
  });

  factory CityData.fromJson(Map<String, dynamic> json) {
    return CityData(
      id: json['id'],
      name: json['name'],
      shippingCost: json['shipping_cost'],
    );
  }
}
