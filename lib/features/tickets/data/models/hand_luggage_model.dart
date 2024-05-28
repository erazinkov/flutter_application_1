import 'package:flutter_application_1/features/tickets/domain/entities/ticket_entity.dart';

class HandLuggageModel extends HandLuggageEntity {
  HandLuggageModel({required super.hasHandLuggage, required super.size});

  factory HandLuggageModel.fromJson(Map<String, dynamic> json) {
    return HandLuggageModel(
        hasHandLuggage: json['has_hand_luggage'], size: json['size']);
  }

  Map<String, dynamic> toJson() {
    return {
      'has_hand_luggage': hasHandLuggage,
      'size': size,
    };
  }
}
