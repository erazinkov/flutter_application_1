import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/features/tickets_offers/domain/entities/tickets_offer_entity.dart';
import 'package:flutter_application_1/features/tickets_offers/presentation/bloc/tickets_offer_list_cubit/tickets_offer_list_cubit.dart';
import 'package:flutter_application_1/features/tickets_offers/presentation/bloc/tickets_offer_list_cubit/tickets_offer_list_state.dart';
import 'package:flutter_application_1/features/tickets_offers/presentation/widgets/tickets_offers_list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketsOffersList extends StatelessWidget {
  const TicketsOffersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketsOfferListCubit, TicketsOfferListState>(
      builder: (context, state) {
        List<TicketsOfferEntity> ticketsOffers = [];

        if (state is TicketsOfferListLoading) {
          return _loadingIndicator();
        } else if (state is TicketsOfferListLoaded) {
          ticketsOffers = state.ticketsOfferList;
        }

        return Column(
          children: [
            ...ticketsOffers.take(3).mapIndexed(
                  (index, element) => TicketsOffersListItem(
                    ticketsOffer: element,
                    color: AppColors.ticketsOffers[index < 3 ? index : 0],
                  ),
                )
          ],
        );
      },
    );
  }

  Widget _loadingIndicator() {
    return Center(
      child: CircularProgressIndicator(
          // color: Colors.white,
          ),
    );
  }
}
