class GovernmentModel {
  final int code;
  final List<GovernmentData> data;

  GovernmentModel({
    required this.code,
    required this.data,
  });

  factory GovernmentModel.fromJson(Map<String, dynamic> json) {
    return GovernmentModel(
      code: json['code'],
      data: List<GovernmentData>.from(
          json['data'].map((city) => GovernmentData.fromJson(city))),
    );
  }
}

class GovernmentData {
  final int id;
  final String name;

  GovernmentData({
    required this.id,
    required this.name,
  });

  factory GovernmentData.fromJson(Map<String, dynamic> json) {
    return GovernmentData(
      id: json['id'],
      name: json['name'],
    );
  }
}
