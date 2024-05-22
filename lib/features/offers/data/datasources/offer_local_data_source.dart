import 'dart:convert';

import 'package:flutter_application_1/core/error/exception.dart';
import 'package:flutter_application_1/features/offers/data/models/offer_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class OfferLocalDataSource {
  Future<List<OfferModel>> getLastOffersFromCache();
  Future<void> offersToCache(List<OfferModel> offers);
}

const String CACHED_OFFERS_LIST = 'CACHED_OFFERS_LIST';

class OfferLocalDataSourceImpl implements OfferLocalDataSource {
  final SharedPreferences sharedPreferences;

  OfferLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<OfferModel>> getLastOffersFromCache() async {
    final jsonOffersList = sharedPreferences.getStringList(CACHED_OFFERS_LIST);
    if (jsonOffersList == null) {
      return Future.value(<OfferModel>[]);
    }
    if (jsonOffersList.isNotEmpty) {
      return Future.value(jsonOffersList
          .map(
            (e) => OfferModel.fromJson(json.decode(e)),
          )
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> offersToCache(List<OfferModel> offers) async {
    final List<String> jsonOffersList = offers
        .map(
          (e) => json.encode(e.toJson()),
        )
        .toList();
    sharedPreferences.setStringList(CACHED_OFFERS_LIST, jsonOffersList);
    return Future.value(jsonOffersList);
  }
}
