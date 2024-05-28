import 'package:equatable/equatable.dart';

class RecommendationEntity extends Equatable {
  final String assetName;
  final String town;
  final String description;

  const RecommendationEntity({
    required this.assetName,
    required this.town,
    required this.description,
  });

  @override
  List<Object?> get props => [assetName, town, description];
}
