import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/error/failure.dart';
import 'package:flutter_application_1/core/usecases/usecase.dart';
import 'package:flutter_application_1/features/tickets_offers/domain/entities/tickets_offer_entity.dart';
import 'package:flutter_application_1/features/tickets_offers/domain/repositories/tickets_offer_repository.dart';

class GetAllTicketsOffers
    extends UserCase<List<TicketsOfferEntity>, TicketsOfferParams> {
  final TicketsOfferRepository ticketsOfferRepository;

  GetAllTicketsOffers(this.ticketsOfferRepository);

  @override
  Future<Either<Failure, List<TicketsOfferEntity>>> call(
      TicketsOfferParams params) async {
    return ticketsOfferRepository.getAllTicketsOffers();
  }
}

class TicketsOfferParams extends Equatable {
  const TicketsOfferParams();

  @override
  List<Object?> get props => [];
}
