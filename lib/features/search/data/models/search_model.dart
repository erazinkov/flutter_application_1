import 'dart:convert';

class SearchModel {
  final String from;
  final String to;
  final String date;
  SearchModel({
    required this.from,
    required this.to,
    required this.date,
  });

  SearchModel copyWith({
    String? from,
    String? to,
    String? date,
  }) {
    return SearchModel(
      from: from ?? this.from,
      to: to ?? this.to,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'from': from,
      'to': to,
      'date': date,
    };
  }

  factory SearchModel.fromMap(Map<String, dynamic> map) {
    return SearchModel(
      from: map['from'] as String,
      to: map['to'] as String,
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchModel.fromJson(String source) =>
      SearchModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SearchModel(from: $from, to: $to, date: $date)';

  @override
  bool operator ==(covariant SearchModel other) {
    if (identical(this, other)) return true;

    return other.from == from && other.to == to && other.date == date;
  }

  @override
  int get hashCode => from.hashCode ^ to.hashCode ^ date.hashCode;
}
