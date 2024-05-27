import 'package:flutter_application_1/features/search/data/models/search_model.dart';

import 'package:flutter_application_1/features/search/presentation/bloc/search_cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit()
      : super(SearchState(SearchModel(
            from: '', to: '', date: DateTime.now().toIso8601String())));

  void onSearchChange({
    String? from,
    String? to,
    String? date,
  }) {
    final newSearch = state.search.copyWith(from: from, to: to, date: date);
    emit(SearchState(newSearch));
  }

  void onSearchSwitch() {
    final currentSearch = state.search;
    final newSearch =
        state.search.copyWith(from: currentSearch.to, to: currentSearch.from);
    emit(SearchState(newSearch));
  }
}
