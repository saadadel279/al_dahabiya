class ZoneModel {
  final int code;
  final List<ZoneData> data;

  ZoneModel({required this.code, required this.data});

  factory ZoneModel.fromJson(Map<String, dynamic> json) {
    return ZoneModel(
      code: json['code'],
      data: List<ZoneData>.from(
          json['data'].map((item) => ZoneData.fromJson(item))),
    );
  }
}

class ZoneData {
  final int id;
  final String name;

  ZoneData({required this.id, required this.name});

  factory ZoneData.fromJson(Map<String, dynamic> json) {
    return ZoneData(
      id: json['id'],
      name: json['name'],
    );
  }
}
