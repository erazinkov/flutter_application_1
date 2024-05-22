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

// {
//   "offers": [
//     {
//       "id": 1,
//       "title": "Die Antwoord",
//       "town": "Будапешт",
//       "price": {
//         "value": 5000
//       }
//     },
//     {
//       "id": 2,
//       "title": "Socrat&Lera",
//       "town": "Санкт-Петербург",
//       "price": {
//         "value": 1999
//       }
//     },
//     {
//       "id": 3,
//       "title": "Лампабикт",
//       "town": "Москва",
//       "price": {
//         "value": 2390
//       }
//     }
//   ]
// }