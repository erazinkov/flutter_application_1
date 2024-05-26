import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/features/search/data/models/search_model.dart';

class SearchState extends Equatable {
  final SearchModel search;
  const SearchState(this.search);

  @override
  List<Object?> get props => [];
}
