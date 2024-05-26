import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/exception.dart';
import 'package:flutter_application_1/core/error/failure.dart';
import 'package:flutter_application_1/core/platform/network_info.dart';
import 'package:flutter_application_1/features/tickets/data/datasources/tickets_local_data_source.dart';
import 'package:flutter_application_1/features/tickets/data/datasources/tickets_remote_data_source.dart';
import 'package:flutter_application_1/features/tickets/domain/entities/ticket_entity.dart';
import 'package:flutter_application_1/features/tickets/domain/repositories/tickets_repository.dart';

class TicketsRepositoryImpl implements TicketsRepository {
  final TicketsLocalDataSource localDataSource;
  final TicketsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  TicketsRepositoryImpl(
      {required this.localDataSource,
      required this.remoteDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<TicketEntity>>> getAllTickets() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTickets = await remoteDataSource.getAllTickets();
        localDataSource.ticketsToCache(remoteTickets);
        return Right(remoteTickets);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTickets = await localDataSource.getLastTicketsFromCache();
        return Right(localTickets);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
