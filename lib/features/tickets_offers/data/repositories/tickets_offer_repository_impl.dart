import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/exception.dart';
import 'package:flutter_application_1/core/error/failure.dart';
import 'package:flutter_application_1/core/platform/network_info.dart';
import 'package:flutter_application_1/features/tickets_offers/data/datasources/tickets_offer_local_data_source.dart';
import 'package:flutter_application_1/features/tickets_offers/data/datasources/tickets_offer_remote_data_source.dart';
import 'package:flutter_application_1/features/tickets_offers/domain/entities/tickets_offer_entity.dart';
import 'package:flutter_application_1/features/tickets_offers/domain/repositories/tickets_offer_repository.dart';

class TicketsOfferRepositoryImpl implements TicketsOfferRepository {
  final TicketsOfferLocalDataSource localDataSource;
  final TicketsOfferRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  TicketsOfferRepositoryImpl(
      {required this.localDataSource,
      required this.remoteDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<TicketsOfferEntity>>>
      getAllTicketsOffers() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTicketsOffer = await remoteDataSource.getAllTicketsOffers();
        localDataSource.ticketsOffersToCache(remoteTicketsOffer);
        return Right(remoteTicketsOffer);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTicketsOffer =
            await localDataSource.getLastTicketsOffersFromCache();
        return Right(localTicketsOffer);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
