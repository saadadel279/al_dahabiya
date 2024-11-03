class UserAddressModel {
  final int code;
  final List<AddressData> data;

  UserAddressModel({required this.code, required this.data});

  // Factory method to create AddressModel from JSON
  factory UserAddressModel.fromJson(Map<String, dynamic> json) {
    return UserAddressModel(
      code: json['code'],
      data: List<AddressData>.from(
          json['data'].map((item) => AddressData.fromJson(item))),
    );
  }

  // Method to convert AddressModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class AddressData {
  final int id;
  final String address;
  final String government;
  final String city;
  final String zone;
  final int shippingCost;

  AddressData({
    required this.id,
    required this.address,
    required this.government,
    required this.city,
    required this.zone,
    required this.shippingCost,
  });

  // Factory method to create AddressData from JSON
  factory AddressData.fromJson(Map<String, dynamic> json) {
    return AddressData(
      id: json['id'],
      address: json['address'],
      government: json['government'],
      city: json['city'],
      zone: json['zone'],
      shippingCost: json['shipping_cost'],
    );
  }

  // Method to convert AddressData to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'address': address,
      'government': government,
      'city': city,
      'zone': zone,
      'shipping_cost': shippingCost,
    };
  }
}
