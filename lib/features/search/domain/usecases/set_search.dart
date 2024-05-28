import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/error/failure.dart';
import 'package:flutter_application_1/core/usecases/usecase.dart';
import 'package:flutter_application_1/features/search/data/models/search_model.dart';
import 'package:flutter_application_1/features/search/domain/repositories/search_repository.dart';

class SetSearch extends UserCase<void, SetSearchParams> {
  final SearchRepository searchRepository;

  SetSearch(this.searchRepository);

  @override
  Future<Either<Failure, void>> call(SetSearchParams params) async {
    return searchRepository.setSearch(params.search);
  }
}

class SetSearchParams extends Equatable {
  final SearchModel search;
  const SetSearchParams(this.search);

  @override
  List<Object?> get props => [search];
}
