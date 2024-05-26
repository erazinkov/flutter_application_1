import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/failure.dart';
import 'package:flutter_application_1/features/tickets/domain/entities/ticket_entity.dart';

abstract class TicketsRepository {
  Future<Either<Failure, List<TicketEntity>>> getAllTickets();
}
