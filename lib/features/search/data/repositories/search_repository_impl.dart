import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/exception.dart';
import 'package:flutter_application_1/core/error/failure.dart';
import 'package:flutter_application_1/features/search/data/datasources/search_local_data_source.dart';
import 'package:flutter_application_1/features/search/data/models/search_model.dart';

import 'package:flutter_application_1/features/search/domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchLocalDataSource localDataSource;

  SearchRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, SearchModel>> getSearch() async {
    try {
      final localSearch = await localDataSource.getSearchFromCache();
      return Right(localSearch);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> setSearch(SearchModel search) async {
    try {
      final localSearch = await localDataSource.searchToCache(search);
      return Right(localSearch);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
