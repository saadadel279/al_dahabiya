class OffersModel {
  int? code;
  List<Offer>? data;

  OffersModel({
    this.code,
    this.data,
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
  int? id;
  String? name;
  String? image;

  Offer({
    this.id,
    this.name,
    this.image,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
