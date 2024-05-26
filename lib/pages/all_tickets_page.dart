import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/features/tickets/presentation/tickets_list.dart';
import 'package:flutter_application_1/pages/widgets/my_text_field.dart';

class AllTicketsPage extends StatelessWidget {
  const AllTicketsPage({super.key});

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
            child: const Column(
              children: [
                MyTextField(
                  assetName: 'assets/icons/plane.svg',
                ),
                Divider(
                  height: 16,
                  thickness: 1,
                  color: AppColors.searchDivider,
                ),
                MyTextField(
                  assetName: 'assets/icons/search.svg',
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Flexible(
            child: const TicketsList(),
          ),
        ],
      ),
    );
  }
}
