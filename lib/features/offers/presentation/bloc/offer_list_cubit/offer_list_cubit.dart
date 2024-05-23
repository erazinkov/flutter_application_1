import 'package:flutter_application_1/core/error/failure.dart';
import 'package:flutter_application_1/features/offers/domain/entities/offer_entity.dart';
import 'package:flutter_application_1/features/offers/domain/usecases/get_all_offers.dart';
import 'package:flutter_application_1/features/offers/presentation/bloc/offer_list_cubit/offer_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class OfferListCubit extends Cubit<OfferListState> {
  final GetAllOffers getAllOffers;

  OfferListCubit({required this.getAllOffers}) : super(OfferListEmpty()) {
    loadOffer();
  }

  void loadOffer() async {
    if (state is OfferListLoading) {
      return;
    }

    final currentState = state;

    var oldOffers = <OfferEntity>[];
    if (currentState is OfferListLoaded) {
      oldOffers = currentState.offerList;
    }

    emit(OfferListLoading(oldOffers));

    final failureOrOffer = await getAllOffers(const OfferParams());

    failureOrOffer.fold(
      (l) => OfferListError(message: ''),
      (r) {
        final newOffers = r;
        emit(OfferListLoaded(newOffers));
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHED_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
