import 'dart:convert';

import 'package:flutter_application_1/core/error/exception.dart';
import 'package:flutter_application_1/features/tickets/data/models/ticket_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TicketsLocalDataSource {
  Future<List<TicketModel>> getLastTicketsFromCache();
  Future<void> ticketsToCache(List<TicketModel> tickets);
}

const String CACHED_TICKETS_LIST = 'CACHED_TICKETS_LIST';

class TicketsLocalDataSourceImpl implements TicketsLocalDataSource {
  final SharedPreferences sharedPreferences;

  TicketsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<TicketModel>> getLastTicketsFromCache() async {
    final jsonTicketsList =
        sharedPreferences.getStringList(CACHED_TICKETS_LIST);
    if (jsonTicketsList == null) {
      return Future.value(<TicketModel>[]);
    }
    if (jsonTicketsList.isNotEmpty) {
      return Future.value(jsonTicketsList
          .map(
            (e) => TicketModel.fromJson(json.decode(e)),
          )
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> ticketsToCache(List<TicketModel> tickets) async {
    final List<String> jsonTicketsList = tickets
        .map(
          (e) => json.encode(e.toJson()),
        )
        .toList();
    sharedPreferences.setStringList(CACHED_TICKETS_LIST, jsonTicketsList);
    return Future.value(jsonTicketsList);
  }
}
