import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/features/tickets_offers/domain/entities/tickets_offer_entity.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TicketsOffersListItem extends StatelessWidget {
  const TicketsOffersListItem(
      {super.key, required this.ticketsOffer, required this.color});

  final TicketsOfferEntity ticketsOffer;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.greyDarker,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ticketsOffer.title,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${ticketsOffer.price.value.toString()} ₽',
                          style: const TextStyle(
                            color: AppColors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const Icon(
                          Icons.navigate_next,
                          color: AppColors.blue,
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  ticketsOffer.timeRange.join(' '),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Image.asset('assets/images/${offer.id}.png'),
  //       const SizedBox(
  //         height: 8,
  //       ),
  //       Text(
  //         offer.title,
  //         style: const TextStyle(
  //           color: AppColors.white,
  //           fontWeight: FontWeight.w600,
  //           fontSize: 16,
  //         ),
  //       ),
  //       const SizedBox(
  //         height: 8,
  //       ),
  //       Text(
  //         offer.town,
  //         style: const TextStyle(
  //           color: AppColors.white,
  //           fontWeight: FontWeight.w400,
  //           fontSize: 14,
  //         ),
  //       ),
  //       const SizedBox(
  //         height: 8,
  //       ),
  //       Row(
  //         children: [
  //           SvgPicture.asset(
  //             'assets/icons/price.svg',
  //             width: 24,
  //             colorFilter:
  //                 const ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
  //           ),
  //           Text(
  //             'from ${offer.price.value.toString()} rub',
  //             style: const TextStyle(
  //               color: AppColors.white,
  //               fontWeight: FontWeight.w400,
  //               fontSize: 14,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }
}
