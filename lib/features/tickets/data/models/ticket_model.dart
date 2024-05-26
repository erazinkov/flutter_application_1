import 'package:flutter_application_1/features/tickets/data/models/hand_luggage_model.dart';
import 'package:flutter_application_1/features/tickets/data/models/info_model.dart';
import 'package:flutter_application_1/features/tickets/data/models/luggage_model.dart';
import 'package:flutter_application_1/features/tickets/data/models/price_model.dart';
import 'package:flutter_application_1/features/tickets/domain/entities/ticket_entity.dart';

class TicketModel extends TicketEntity {
  const TicketModel({
    required id,
    required badge,
    required price,
    required providerName,
    required company,
    required departure,
    required arrival,
    required hasTransfer,
    required hasVisaTransfer,
    required luggage,
    required handLuggage,
    required isReturnable,
    required isExchangable,
  }) : super(
          id: id,
          badge: badge,
          price: price,
          providerName: providerName,
          company: company,
          departure: departure,
          arrival: arrival,
          hasTransfer: hasTransfer,
          hasVisaTransfer: hasVisaTransfer,
          luggage: luggage,
          handLuggage: handLuggage,
          isReturnable: isReturnable,
          isExchangable: isExchangable,
        );

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      id: json['id'],
      badge: json['badge'],
      price: json['price'] != null ? PriceModel.fromJson(json['price']) : null,
      providerName: json['provider_name'],
      company: json['company'],
      departure: json['departure'] != null
          ? InfoModel.fromJson(json['departure'])
          : null,
      arrival:
          json['arrival'] != null ? InfoModel.fromJson(json['arrival']) : null,
      hasTransfer: json['has_transfer'],
      hasVisaTransfer: json['has_visa_transfer'],
      luggage: json['luggage'] != null
          ? LuggageModel.fromJson(json['luggage'])
          : null,
      handLuggage: json['hand_luggage'] != null
          ? HandLuggageModel.fromJson(json['hand_luggage'])
          : null,
      isReturnable: json['is_returnable'],
      isExchangable: json['is_exchangable'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'badge': badge,
      'price': price,
      'provider_name': providerName,
      'company': company,
      'departure': departure,
      'arrival': arrival,
      'has_transfer': hasTransfer,
      'has_visa_transfer': hasVisaTransfer,
      'luggage': luggage,
      'hand_luggage': handLuggage,
      'is_returnable': isReturnable,
      'is_exchangable': isExchangable,
    };
  }
}
