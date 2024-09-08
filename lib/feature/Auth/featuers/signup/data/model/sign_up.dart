class SignUpModel {
  int? code;
  Data data;

  SignUpModel({required this.code, required this.data});

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      code: json['code'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  String message;
  String token;

  Data({required this.message, required this.token});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      message: json['message'],
      token: json['token'],
    );
  }
}
