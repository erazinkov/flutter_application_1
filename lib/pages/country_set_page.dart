import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/features/tickets_offers/presentation/tickets_offers_list.dart';
import 'package:flutter_application_1/pages/widgets/info_row.dart';
import 'package:flutter_application_1/pages/widgets/my_text_field.dart';

class CountrySetPage extends StatelessWidget {
  const CountrySetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.searchGreyDark,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // MyTextField(
                //   assetName: 'assets/icons/plane.svg',
                //   onChanged: () {},
                // ),
                // Divider(
                //   height: 16,
                //   thickness: 1,
                //   color: AppColors.searchDivider,
                // ),
                // MyTextField(
                //   assetName: 'assets/icons/search.svg',
                //   onChanged: () {},
                // ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: InfoRow(),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.searchGreyDark,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.only(
              top: 16,
              right: 16,
              bottom: 6,
              left: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Прямые рейсы',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const TicketsOffersList(),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () => {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    width: double.infinity,
                    child: const Text(
                      'Показать все',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () => {},
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(8)),
              child: const Text(
                'Посмотреть все билеты',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
