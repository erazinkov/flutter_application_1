import 'package:flutter_application_1/features/tickets/domain/entities/ticket_entity.dart';

class InfoModel extends InfoEntity {
  const InfoModel({town, date, airport})
      : super(town: town, date: date, airport: airport);

  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return InfoModel(
      town: json['town'] as String,
      date: json['date'] as String,
      airport: json['airport'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'town': town,
      'date': date,
      'airport': airport,
    };
  }
}
