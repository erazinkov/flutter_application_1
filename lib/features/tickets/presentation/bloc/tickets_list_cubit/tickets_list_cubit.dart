import 'package:flutter_application_1/core/error/failure.dart';
import 'package:flutter_application_1/features/tickets/domain/entities/ticket_entity.dart';
import 'package:flutter_application_1/features/tickets/domain/usecases/get_all_tickets.dart';
import 'package:flutter_application_1/features/tickets/presentation/bloc/tickets_list_cubit/tickets_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class TicketsListCubit extends Cubit<TicketsListState> {
  final GetAllTickets getAllTickets;

  TicketsListCubit({required this.getAllTickets}) : super(TicketsListEmpty()) {
    loadTickets();
  }

  void loadTickets() async {
    if (state is TicketsListLoading) {
      return;
    }

    final currentState = state;

    var oldTickets = <TicketEntity>[];
    if (currentState is TicketsListLoaded) {
      oldTickets = currentState.ticketsList;
    }

    emit(TicketsListLoading(oldTickets));

    final failureOrTickets = await getAllTickets(const TicketParams());

    failureOrTickets.fold(
      (l) => TicketsListError(message: _mapFailureToMessage(l)),
      (r) {
        final newTickets = r;
        emit(TicketsListLoaded(newTickets));
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
