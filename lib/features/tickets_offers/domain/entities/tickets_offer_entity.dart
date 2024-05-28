import 'package:equatable/equatable.dart';

class TicketsOfferEntity extends Equatable {
  final int id;
  final String title;
  final List<String> timeRange;
  final PriceEntity price;

  const TicketsOfferEntity({
    required this.id,
    required this.title,
    required this.timeRange,
    required this.price,
  });

  @override
  List<Object?> get props => [id, title, timeRange, price];
}

class PriceEntity extends Equatable {
  final int value;
  const PriceEntity({required this.value});

  @override
  List<Object?> get props => [value];
}
