import 'dart:convert';

import 'package:flutter_application_1/core/error/exception.dart';
import 'package:flutter_application_1/features/tickets_offers/data/models/tickets_offer_model.dart';
import 'package:http/http.dart' as http;

abstract class TicketsOfferRemoteDataSource {
  Future<List<TicketsOfferModel>> getAllTicketsOffers();
}

class TicketsOfferRemoteDataSourceImpl implements TicketsOfferRemoteDataSource {
  final http.Client client;

  TicketsOfferRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TicketsOfferModel>> getAllTicketsOffers() async {
    final response = await client.get(
        Uri.parse(
            'https://run.mocky.io/v3/7e55bf02-89ff-4847-9eb7-7d83ef884017'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final ticketsOffers = json.decode(response.body);
      return (ticketsOffers['tickets_offers'] as List)
          .map(
            (e) => TicketsOfferModel.fromJson(e),
          )
          .toList();
    } else {
      throw ServerException();
    }
  }
}
