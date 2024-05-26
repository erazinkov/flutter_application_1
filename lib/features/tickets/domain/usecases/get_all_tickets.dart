import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/error/failure.dart';
import 'package:flutter_application_1/core/usecases/usecase.dart';
import 'package:flutter_application_1/features/tickets/domain/entities/ticket_entity.dart';
import 'package:flutter_application_1/features/tickets/domain/repositories/tickets_repository.dart';

class GetAllTickets extends UserCase<List<TicketEntity>, TicketParams> {
  final TicketsRepository ticketsRepository;

  GetAllTickets(this.ticketsRepository);

  @override
  Future<Either<Failure, List<TicketEntity>>> call(TicketParams params) async {
    return ticketsRepository.getAllTickets();
  }
}

class TicketParams extends Equatable {
  const TicketParams();

  @override
  List<Object?> get props => [];
}
