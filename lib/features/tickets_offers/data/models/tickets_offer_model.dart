import 'package:flutter_application_1/features/tickets_offers/data/models/price_model.dart';
import 'package:flutter_application_1/features/tickets_offers/domain/entities/tickets_offer_entity.dart';

class TicketsOfferModel extends TicketsOfferEntity {
  const TicketsOfferModel({
    required id,
    required title,
    required timeRange,
    required price,
  }) : super(
          id: id,
          title: title,
          timeRange: timeRange,
          price: price,
        );

  factory TicketsOfferModel.fromJson(Map<String, dynamic> json) {
    return TicketsOfferModel(
      id: json['id'],
      title: json['title'],
      timeRange: (json['time_range'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      price: json['price'] != null ? PriceModel.fromJson(json['price']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'time_range': timeRange,
      'price': price,
    };
  }
}
