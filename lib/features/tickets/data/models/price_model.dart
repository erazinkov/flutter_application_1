import 'package:flutter_application_1/features/tickets/domain/entities/ticket_entity.dart';

class PriceModel extends PriceEntity {
  const PriceModel({value}) : super(value: value);

  factory PriceModel.fromJson(Map<String, dynamic> json) {
    return PriceModel(
      value: json['value'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
    };
  }
}
