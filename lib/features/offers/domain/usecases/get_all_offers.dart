import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/error/failure.dart';
import 'package:flutter_application_1/core/usecases/usecase.dart';
import 'package:flutter_application_1/features/offers/domain/entities/offer_entity.dart';
import 'package:flutter_application_1/features/offers/domain/repositories/offer_repository.dart';

class GetAllOffers extends UserCase<List<OfferEntity>, OfferParams> {
  final OfferRepository offerRepository;

  GetAllOffers(this.offerRepository);

  @override
  Future<Either<Failure, List<OfferEntity>>> call(OfferParams params) async {
    return offerRepository.getAllOffers();
  }
}

class OfferParams extends Equatable {
  const OfferParams();

  @override
  List<Object?> get props => [];
}
