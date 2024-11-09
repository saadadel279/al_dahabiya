class CancelOrderModel {
  final int code;
  final String status;
  final String message;

  CancelOrderModel({
    required this.code,
    required this.status,
    required this.message,
  });

  factory CancelOrderModel.fromJson(Map<String, dynamic> json) {
    return CancelOrderModel(
      code: json['code'] as int,
      status: json['status'] as String,
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'status': status,
      'message': message,
    };
  }
}
