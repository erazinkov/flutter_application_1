import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/failure.dart';
import 'package:flutter_application_1/features/tickets_offers/domain/entities/tickets_offer_entity.dart';

abstract class TicketsOfferRepository {
  Future<Either<Failure, List<TicketsOfferEntity>>> getAllTicketsOffers();
}
