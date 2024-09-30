class OrderResponseModel {
  int code;
  OrderData data;

  OrderResponseModel({
    required this.code,
    required this.data,
  });

  // Factory constructor to create ApiResponse from JSON
  factory OrderResponseModel.fromJson(Map<String, dynamic> json) {
    return OrderResponseModel(
      code: json['code'],
      data: OrderData.fromJson(json['data']),
    );
  }

  // Method to convert ApiResponse to JSON
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'data': data.toJson(),
    };
  }
}

class OrderData {
  int userAddressId;
  double shipping;
  String paymentType;
  String deliveryTime;
  String comment;
  double discount;
  int userId;
  double subTotal;
  double total;
  String orderCurrency;
  int usePoints;
  int points;
  double pointPrice;
  int currentStatusId;
  String updatedAt;
  String createdAt;
  int id;

  OrderData({
    required this.userAddressId,
    required this.shipping,
    required this.paymentType,
    required this.deliveryTime,
    required this.comment,
    required this.discount,
    required this.userId,
    required this.subTotal,
    required this.total,
    required this.orderCurrency,
    required this.usePoints,
    required this.points,
    required this.pointPrice,
    required this.currentStatusId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  // Factory constructor to create OrderData from JSON
  factory OrderData.fromJson(Map<String, dynamic> json) {
    return OrderData(
      userAddressId: json['user_address_id'],
      shipping: json['shipping'].toDouble(),
      paymentType: json['payment_type'],
      deliveryTime: json['delivery_time'],
      comment: json['comment'],
      discount: json['discount'].toDouble(),
      userId: json['user_id'],
      subTotal: json['sub_total'].toDouble(),
      total: json['total'].toDouble(),
      orderCurrency: json['order_currency'],
      usePoints: json['use_points'],
      points: json['points'],
      pointPrice: json['point_price'].toDouble(),
      currentStatusId: json['current_status_id'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      id: json['id'],
    );
  }

  // Method to convert OrderData to JSON
  Map<String, dynamic> toJson() {
    return {
      'user_address_id': userAddressId,
      'shipping': shipping,
      'payment_type': paymentType,
      'delivery_time': deliveryTime,
      'comment': comment,
      'discount': discount,
      'user_id': userId,
      'sub_total': subTotal,
      'total': total,
      'order_currency': orderCurrency,
      'use_points': usePoints,
      'points': points,
      'point_price': pointPrice,
      'current_status_id': currentStatusId,
      'updated_at': updatedAt,
      'created_at': createdAt,
      'id': id,
    };
  }
}
