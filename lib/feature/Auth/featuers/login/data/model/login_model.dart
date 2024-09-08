class LoginModel {
  int? code;
  Data data;

  LoginModel({required this.code, required this.data});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
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
