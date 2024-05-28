import 'package:flutter_application_1/core/error/failure.dart';
import 'package:flutter_application_1/features/tickets_offers/domain/entities/tickets_offer_entity.dart';
import 'package:flutter_application_1/features/tickets_offers/domain/usecases/get_all_tickets_offers.dart';
import 'package:flutter_application_1/features/tickets_offers/presentation/bloc/tickets_offer_list_cubit/tickets_offer_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class TicketsOfferListCubit extends Cubit<TicketsOfferListState> {
  final GetAllTicketsOffers getAllTicketsOffers;

  TicketsOfferListCubit({required this.getAllTicketsOffers})
      : super(TicketsOfferListEmpty()) {
    loadTicketsOffer();
  }

  void loadTicketsOffer() async {
    if (state is TicketsOfferListLoading) {
      return;
    }

    final currentState = state;

    var oldTicketsOffers = <TicketsOfferEntity>[];
    if (currentState is TicketsOfferListLoaded) {
      oldTicketsOffers = currentState.ticketsOfferList;
    }

    emit(TicketsOfferListLoading(oldTicketsOffers));

    final failureOrTicketsOffer =
        await getAllTicketsOffers(const TicketsOfferParams());

    failureOrTicketsOffer.fold(
      (l) => TicketsOfferListError(message: _mapFailureToMessage(l)),
      (r) {
        final newTicketsOffers = r;
        emit(TicketsOfferListLoaded(newTicketsOffers));
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
