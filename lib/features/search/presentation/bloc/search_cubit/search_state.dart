// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_application_1/features/search/data/models/search_model.dart';

class SearchState {
  final SearchModel search;
  const SearchState(
    this.search,
  );

  SearchState copyWith({
    SearchModel? search,
  }) {
    return SearchState(
      search ?? this.search,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'search': search.toMap(),
    };
  }

  factory SearchState.fromMap(Map<String, dynamic> map) {
    return SearchState(
      SearchModel.fromMap(map['search'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchState.fromJson(String source) =>
      SearchState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SearchState(search: $search)';

  @override
  bool operator ==(covariant SearchState other) {
    if (identical(this, other)) return true;

    return other.search == search;
  }

  @override
  int get hashCode => search.hashCode;
}
