import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/features/tickets_offers/domain/entities/tickets_offer_entity.dart';

abstract class TicketsOfferListState extends Equatable {
  const TicketsOfferListState();

  @override
  List<Object?> get props => [];
}

class TicketsOfferListEmpty extends TicketsOfferListState {
  @override
  List<Object?> get props => [];
}

class TicketsOfferListLoading extends TicketsOfferListState {
  final List<TicketsOfferEntity> oldTicketsOfferList;
  final bool isFirstFetch;

  const TicketsOfferListLoading(this.oldTicketsOfferList,
      {this.isFirstFetch = false});

  @override
  List<Object?> get props => [oldTicketsOfferList];
}

class TicketsOfferListLoaded extends TicketsOfferListState {
  final List<TicketsOfferEntity> ticketsOfferList;

  const TicketsOfferListLoaded(this.ticketsOfferList);

  @override
  List<Object?> get props => [ticketsOfferList];
}

class TicketsOfferListError extends TicketsOfferListState {
  final String message;

  const TicketsOfferListError({required this.message});

  @override
  List<Object?> get props => [message];
}
