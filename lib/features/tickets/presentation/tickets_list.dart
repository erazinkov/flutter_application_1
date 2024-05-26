import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/features/tickets/domain/entities/ticket_entity.dart';
import 'package:flutter_application_1/features/tickets/presentation/bloc/tickets_list_cubit/tickets_list_cubit.dart';
import 'package:flutter_application_1/features/tickets/presentation/bloc/tickets_list_cubit/tickets_list_state.dart';
import 'package:flutter_application_1/features/tickets/presentation/widgets/tickets_list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketsList extends StatelessWidget {
  const TicketsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketsListCubit, TicketsListState>(
      builder: (context, state) {
        List<TicketEntity> tickets = [];

        if (state is TicketsListLoading) {
          return _loadingIndicator();
        } else if (state is TicketsListLoaded) {
          tickets = state.ticketsList;
        }

        return ListView.separated(
          itemBuilder: (context, index) => TicketsListItem(
            ticket: tickets[index],
          ),
          itemCount: tickets.length,
          separatorBuilder: (context, index) => const SizedBox(
            height: 8,
          ),
        );
      },
    );
  }

  Widget _loadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
          // color: Colors.white,
          ),
    );
  }
}
