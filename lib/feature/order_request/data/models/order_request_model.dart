class OrderRequestModel {
  int address;
  String coupon;
  String paymentType;
  String deliveryTime;
  String comment;
  int points;
  List<ProductData> data;

  OrderRequestModel({
    required this.address,
    required this.coupon,
    required this.paymentType,
    required this.deliveryTime,
    required this.comment,
    required this.points,
    required this.data,
  });

  factory OrderRequestModel.fromJson(Map<String, dynamic> json) {
    return OrderRequestModel(
      address: json['address'],
      coupon: json['coupon'],
      paymentType: json['payment_type'],
      deliveryTime: json['delivery_time'],
      comment: json['comment'],
      points: json['points'],
      data: (json['data'] as List).map((i) => ProductData.fromJson(i)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'coupon': coupon,
      'payment_type': paymentType,
      'delivery_time': deliveryTime,
      'comment': comment,
      'points': points,
      'data': data.map((i) => i.toJson()).toList(),
    };
  }
}

class ProductData {
  int productId;
  int option1;
  int option2;
  int q;

  ProductData({
    required this.productId,
    required this.option1,
    required this.option2,
    required this.q,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      productId: json['product_id'],
      option1: json['option1'],
      option2: json['option2'],
      q: json['q'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'option1': option1,
      'option2': option2,
      'q': q,
    };
  }
}
