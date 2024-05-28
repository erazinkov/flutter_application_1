import 'package:flutter_application_1/features/search/data/models/search_model.dart';
import 'package:flutter_application_1/features/search/domain/usecases/get_search.dart';
import 'package:flutter_application_1/features/search/domain/usecases/set_search.dart';

import 'package:flutter_application_1/features/search/presentation/bloc/search_cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SearchCubit extends Cubit<SearchState> {
  final GetSearch getSearch;
  final SetSearch setSearch;

  SearchCubit({required this.getSearch, required this.setSearch})
      : super(
          SearchState(
            search: SearchModel(
                from: '',
                to: '',
                date: DateFormat('dd MMMM, E', 'ru')
                    .format(DateTime.now())
                    .toLowerCase()),
          ),
        ) {
    checkLocalSearch();
  }

  Future<void> checkLocalSearch() async {
    final failureOrSearch = await getSearch(const GetSearchParams());

    failureOrSearch.fold(
      (l) => emit(SearchState(
        search: SearchModel(
          from: '',
          to: '',
          date: DateFormat('dd MMMM, E', 'ru')
              .format(DateTime.now())
              .toLowerCase(),
        ),
      )),
      (r) {
        emit(SearchState(search: r));
      },
    );
  }

  Future<void> setLocalSearch(SearchModel search) async {
    final failureOrSearch = await setSearch(SetSearchParams(search));

    failureOrSearch.fold(
      (l) => {},
      (r) => {},
    );
  }

  void onSearchChange({
    String? from,
    String? to,
    String? date,
  }) {
    final newSearch = state.search.copyWith(from: from, to: to, date: date);
    setLocalSearch(newSearch);
    emit(SearchState(search: newSearch));
  }

  void onSearchSwitch() {
    final currentSearch = state.search;
    final newSearch =
        state.search.copyWith(from: currentSearch.to, to: currentSearch.from);
    setLocalSearch(newSearch);
    emit(SearchState(search: newSearch));
  }
}
