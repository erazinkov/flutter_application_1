import 'dart:convert';

import 'package:flutter_application_1/core/error/exception.dart';
import 'package:flutter_application_1/features/offers/data/models/offer_model.dart';
import 'package:http/http.dart' as http;

abstract class OfferRemoteDataSource {
  Future<List<OfferModel>> getAllOffers();
}

class OfferRemoteDataSourceImpl implements OfferRemoteDataSource {
  final http.Client client;

  OfferRemoteDataSourceImpl({required this.client});

  @override
  Future<List<OfferModel>> getAllOffers() async {
    final response = await client.get(
        Uri.parse(
            'https://run.mocky.io/v3/214a1713-bac0-4853-907c-a1dfc3cd05fd'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final offers = json.decode(response.body);
      return (offers['offers'] as List)
          .map(
            (e) => OfferModel.fromJson(e),
          )
          .toList();
    } else {
      throw ServerException();
    }
  }
}
