class ErrorModel {
  final int code;
  final String message;
  final String status;

  ErrorModel({
    required this.code,
    required this.message,
    required this.status,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      code: json['success'],
      message: json['message'],
      status: json['status'],
    );
  }
}
