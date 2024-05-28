import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/failure.dart';
import 'package:flutter_application_1/features/search/data/models/search_model.dart';

abstract class SearchRepository {
  Future<Either<Failure, SearchModel>> getSearch();
  Future<Either<Failure, void>> setSearch(SearchModel search);
}
