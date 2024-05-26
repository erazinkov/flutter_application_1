import 'package:flutter_application_1/features/search/data/models/search_model.dart';
import 'package:flutter_application_1/features/search/presentation/bloc/search_cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit()
      : super(SearchState(SearchModel(
            from: 'Откуда',
            to: 'Куда',
            date: DateTime.now().toIso8601String())));

  void onSearchChange({
    String? from,
    String? to,
    String? date,
  }) async {
    final newSearch = state.search.copyWith(from: from, to: to, date: date);
    emit(SearchState(newSearch));
  }
}
