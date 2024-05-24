import 'package:equatable/equatable.dart';

class OfferEntity extends Equatable {
  final int id;
  final String title;
  final String town;
  final PriceEntity price;

  const OfferEntity({
    required this.id,
    required this.title,
    required this.town,
    required this.price,
  });

  @override
  List<Object?> get props => [id, title, town, price];
}

class PriceEntity extends Equatable {
  final int value;
  const PriceEntity({required this.value});

  @override
  List<Object?> get props => [value];
}
