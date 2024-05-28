import 'package:flutter_application_1/features/offers/data/models/price_model.dart';
import 'package:flutter_application_1/features/offers/domain/entities/offer_entity.dart';

class OfferModel extends OfferEntity {
  const OfferModel({
    required id,
    required title,
    required town,
    required price,
  }) : super(
          id: id,
          title: title,
          town: town,
          price: price,
        );

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'],
      title: json['title'],
      town: json['town'],
      price: json['price'] != null ? PriceModel.fromJson(json['price']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'town': town,
      'price': price,
    };
  }
}
