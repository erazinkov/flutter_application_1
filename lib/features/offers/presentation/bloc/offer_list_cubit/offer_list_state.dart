import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/features/offers/domain/entities/offer_entity.dart';

abstract class OfferListState extends Equatable {
  const OfferListState();

  @override
  List<Object?> get props => [];
}

class OfferListEmpty extends OfferListState {
  @override
  List<Object?> get props => [];
}

class OfferListLoading extends OfferListState {
  final List<OfferEntity> oldOfferList;
  final bool isFirstFetch;

  const OfferListLoading(this.oldOfferList, {this.isFirstFetch = false});

  @override
  List<Object?> get props => [oldOfferList];
}

class OfferListLoaded extends OfferListState {
  final List<OfferEntity> offerList;

  const OfferListLoaded(this.offerList);

  @override
  List<Object?> get props => [offerList];
}

class OfferListError extends OfferListState {
  final String message;

  const OfferListError({required this.message});

  @override
  List<Object?> get props => [message];
}
