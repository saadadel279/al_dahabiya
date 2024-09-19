class OffersModel {
  int code;
  List<Offer> data;

  OffersModel({
    required this.code,
    required this.data,
  });

  factory OffersModel.fromJson(Map<String, dynamic> json) {
    return OffersModel(
      code: json['code'],
      data:
          List<Offer>.from(json['data'].map((offer) => Offer.fromJson(offer))),
    );
  }
}

class Offer {
  int id;
  String name;
  String image;

  Offer({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
