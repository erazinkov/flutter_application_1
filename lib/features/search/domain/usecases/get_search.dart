import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/error/failure.dart';
import 'package:flutter_application_1/core/usecases/usecase.dart';
import 'package:flutter_application_1/features/search/data/models/search_model.dart';

import 'package:flutter_application_1/features/search/domain/repositories/search_repository.dart';

class GetSearch extends UserCase<SearchModel, GetSearchParams> {
  final SearchRepository searchRepository;

  GetSearch(this.searchRepository);

  @override
  Future<Either<Failure, SearchModel>> call(GetSearchParams params) async {
    return searchRepository.getSearch();
  }
}

class GetSearchParams extends Equatable {
  const GetSearchParams();

  @override
  List<Object?> get props => [];
}
