import 'dart:convert';

import 'package:flutter_application_1/core/error/exception.dart';
import 'package:flutter_application_1/features/tickets_offers/data/models/tickets_offer_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TicketsOfferLocalDataSource {
  Future<List<TicketsOfferModel>> getLastTicketsOffersFromCache();
  Future<void> ticketsOffersToCache(List<TicketsOfferModel> ticketsOffers);
}

const String CACHED_TICKETS_OFFERS_LIST = 'CACHED_TICKETS_OFFERS_LIST';

class TicketsOfferLocalDataSourceImpl implements TicketsOfferLocalDataSource {
  final SharedPreferences sharedPreferences;

  TicketsOfferLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<TicketsOfferModel>> getLastTicketsOffersFromCache() async {
    final jsonTicketsOffersList =
        sharedPreferences.getStringList(CACHED_TICKETS_OFFERS_LIST);
    if (jsonTicketsOffersList == null) {
      return Future.value(<TicketsOfferModel>[]);
    }
    if (jsonTicketsOffersList.isNotEmpty) {
      return Future.value(jsonTicketsOffersList
          .map(
            (e) => TicketsOfferModel.fromJson(json.decode(e)),
          )
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> ticketsOffersToCache(
      List<TicketsOfferModel> ticketsOffers) async {
    final List<String> jsonTicketsOffersList = ticketsOffers
        .map(
          (e) => json.encode(e.toJson()),
        )
        .toList();
    sharedPreferences.setStringList(
        CACHED_TICKETS_OFFERS_LIST, jsonTicketsOffersList);
    return Future.value(jsonTicketsOffersList);
  }
}
