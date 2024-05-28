import 'dart:convert';

import 'package:flutter_application_1/features/search/data/models/search_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

abstract class SearchLocalDataSource {
  Future<SearchModel> getSearchFromCache();
  Future<void> searchToCache(SearchModel search);
}

const String CACHED_SEARCH = 'CACHED_SEARCH';

class SearchLocalDataSourceImpl implements SearchLocalDataSource {
  final SharedPreferences sharedPreferences;

  SearchLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<SearchModel> getSearchFromCache() async {
    final jsonSearch = sharedPreferences.getString(CACHED_SEARCH);
    if (jsonSearch == null) {
      return Future.value(SearchModel());
    }

    final search = SearchModel.fromJson(json.decode(jsonSearch));
    return Future.value(search);
  }

  @override
  Future<void> searchToCache(SearchModel search) async {
    final String jsonSearch = json.encode(search.toJson());

    sharedPreferences.setString(CACHED_SEARCH, jsonSearch);
    return Future.value(jsonSearch);
  }
}
