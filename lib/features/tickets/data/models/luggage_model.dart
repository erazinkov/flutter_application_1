import 'package:flutter_application_1/features/tickets/data/models/price_model.dart';
import 'package:flutter_application_1/features/tickets/domain/entities/ticket_entity.dart';

class LuggageModel extends LuggageEntity {
  LuggageModel({required super.hasLuggage, required super.price});

  factory LuggageModel.fromJson(Map<String, dynamic> json) {
    return LuggageModel(
      hasLuggage: json['has_luggage'],
      price: json['price'] != null ? PriceModel.fromJson(json['price']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'has_luggage': hasLuggage,
      'price': price,
    };
  }
}
