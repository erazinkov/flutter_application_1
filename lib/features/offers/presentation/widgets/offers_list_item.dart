import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/features/offers/domain/entities/offer_entity.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OffersListItem extends StatelessWidget {
  const OffersListItem({super.key, required this.offer});

  final OfferEntity offer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/images/${offer.id}.png'),
        const SizedBox(
          height: 8,
        ),
        Text(
          offer.title,
          style: const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          offer.town,
          style: const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/price.svg',
              width: 24,
              colorFilter:
                  const ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              'from ${offer.price.value.toString()} rub',
              style: const TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],

      // width: 123,
      // height: 132,

      // child: Image.asset('assets/images/${offer.id}.png'),
    );
  }
}
