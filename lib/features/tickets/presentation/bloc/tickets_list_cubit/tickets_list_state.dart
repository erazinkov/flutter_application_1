import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/features/tickets/domain/entities/ticket_entity.dart';

abstract class TicketsListState extends Equatable {
  const TicketsListState();

  @override
  List<Object?> get props => [];
}

class TicketsListEmpty extends TicketsListState {
  @override
  List<Object?> get props => [];
}

class TicketsListLoading extends TicketsListState {
  final List<TicketEntity> oldTicketsList;
  final bool isFirstFetch;

  const TicketsListLoading(this.oldTicketsList, {this.isFirstFetch = false});

  @override
  List<Object?> get props => [oldTicketsList];
}

class TicketsListLoaded extends TicketsListState {
  final List<TicketEntity> ticketsList;

  const TicketsListLoaded(this.ticketsList);

  @override
  List<Object?> get props => [ticketsList];
}

class TicketsListError extends TicketsListState {
  final String message;

  const TicketsListError({required this.message});

  @override
  List<Object?> get props => [message];
}
