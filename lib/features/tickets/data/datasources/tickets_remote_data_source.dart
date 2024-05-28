import 'dart:convert';

import 'package:flutter_application_1/core/error/exception.dart';
import 'package:flutter_application_1/features/tickets/data/models/ticket_model.dart';
import 'package:http/http.dart' as http;

abstract class TicketsRemoteDataSource {
  Future<List<TicketModel>> getAllTickets();
}

class TicketsRemoteDataSourceImpl implements TicketsRemoteDataSource {
  final http.Client client;

  TicketsRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TicketModel>> getAllTickets() async {
    final response = await client.get(
        Uri.parse(
            'https://run.mocky.io/v3/670c3d56-7f03-4237-9e34-d437a9e56ebf'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final tickets = json.decode(response.body);
      return (tickets['tickets'] as List)
          .map(
            (e) => TicketModel.fromJson(e),
          )
          .toList();
    } else {
      throw ServerException();
    }
  }
}
