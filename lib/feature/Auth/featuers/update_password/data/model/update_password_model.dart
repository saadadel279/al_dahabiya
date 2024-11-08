class UpdatePasswordModel {
  final int code;
  final String status;
  final String message;

  UpdatePasswordModel({
    required this.code,
    required this.status,
    required this.message,
  });

  factory UpdatePasswordModel.fromJson(Map<String, dynamic> json) {
    return UpdatePasswordModel(
      code: json['code'],
      status: json['status'],
      message: json['message'],
    );
  }
}
