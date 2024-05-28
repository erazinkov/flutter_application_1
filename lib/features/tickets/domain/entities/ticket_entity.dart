import 'package:equatable/equatable.dart';

class TicketEntity extends Equatable {
  final int id;
  final String? badge;
  final PriceEntity price;
  final String providerName;
  final String company;
  final InfoEntity departure;
  final InfoEntity arrival;
  final bool hasTransfer;
  final bool hasVisaTransfer;
  final LuggageEntity luggage;
  final HandLuggageEntity handLuggage;
  final bool isReturnable;
  final bool isExchangable;
  const TicketEntity({
    required this.id,
    required this.badge,
    required this.price,
    required this.providerName,
    required this.company,
    required this.departure,
    required this.arrival,
    required this.hasTransfer,
    required this.hasVisaTransfer,
    required this.luggage,
    required this.handLuggage,
    required this.isReturnable,
    required this.isExchangable,
  });

  @override
  List<Object?> get props => [
        id,
        badge,
        price,
        providerName,
        company,
        departure,
        arrival,
        hasTransfer,
        hasVisaTransfer,
        luggage,
        handLuggage,
        isReturnable,
        isExchangable
      ];
}

class PriceEntity extends Equatable {
  final int value;
  const PriceEntity({required this.value});

  @override
  List<Object?> get props => [value];
}

class InfoEntity extends Equatable {
  final String town;
  final String date;
  final String airport;
  const InfoEntity(
      {required this.town, required this.date, required this.airport});

  @override
  List<Object?> get props => [town, date, airport];
}

class LuggageEntity extends Equatable {
  final bool hasLuggage;
  final PriceEntity? price;
  const LuggageEntity({required this.hasLuggage, this.price});

  @override
  List<Object?> get props => [hasLuggage, price];
}

class HandLuggageEntity extends Equatable {
  final bool hasHandLuggage;
  final String? size;
  const HandLuggageEntity({required this.hasHandLuggage, required this.size});

  @override
  List<Object?> get props => [hasHandLuggage, size];
}
