import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/offers/domain/entities/offer_entity.dart';
import 'package:flutter_application_1/features/offers/presentation/bloc/offer_list_cubit/offer_list_cubit.dart';
import 'package:flutter_application_1/features/offers/presentation/bloc/offer_list_cubit/offer_list_state.dart';
import 'package:flutter_application_1/features/offers/presentation/widgets/offers_list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OffersList extends StatelessWidget {
  const OffersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OfferListCubit, OfferListState>(
      builder: (context, state) {
        List<OfferEntity> offers = [];

        if (state is OfferListLoading) {
          return _loadingIndicator();
        } else if (state is OfferListLoaded) {
          offers = state.offerList;
        }

        return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return OffersListItem(
              offer: offers[index],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 5,
              height: 1,
            );
          },
          itemCount: offers.length,
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
