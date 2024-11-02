class AddedAddressModel {
  final int code;
  final String status;
  final String message;

  AddedAddressModel({
    required this.code,
    required this.status,
    required this.message,
  });

  factory AddedAddressModel.fromJson(Map<String, dynamic> json) {
    return AddedAddressModel(
      code: json['code'],
      status: json['status'],
      message: json['message'],
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
