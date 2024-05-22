import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/failure.dart';
import 'package:flutter_application_1/features/offers/domain/entities/offer_entity.dart';

abstract class OfferRepository {
  Future<Either<Failure, List<OfferEntity>>> getAllOffers();
}
