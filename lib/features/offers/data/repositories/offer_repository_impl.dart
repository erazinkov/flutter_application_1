import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/exception.dart';
import 'package:flutter_application_1/core/error/failure.dart';
import 'package:flutter_application_1/core/platform/network_info.dart';
import 'package:flutter_application_1/features/offers/data/datasources/offer_local_data_source.dart';
import 'package:flutter_application_1/features/offers/data/datasources/offer_remote_data_source.dart';
import 'package:flutter_application_1/features/offers/domain/entities/offer_entity.dart';
import 'package:flutter_application_1/features/offers/domain/repositories/offer_repository.dart';

class OfferRepositoryImpl implements OfferRepository {
  final OfferLocalDataSource localDataSource;
  final OfferRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  OfferRepositoryImpl(
      {required this.localDataSource,
      required this.remoteDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<OfferEntity>>> getAllOffers() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteOffer = await remoteDataSource.getAllOffers();
        localDataSource.offersToCache(remoteOffer);
        return Right(remoteOffer);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localOffer = await localDataSource.getLastOffersFromCache();
        return Right(localOffer);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
