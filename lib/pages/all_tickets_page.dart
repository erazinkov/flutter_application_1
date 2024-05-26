import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/features/tickets/presentation/tickets_list.dart';
import 'package:flutter_application_1/pages/widgets/floating_buttons.dart';
import 'package:flutter_application_1/pages/widgets/my_text_field.dart';

class AllTicketsPage extends StatelessWidget {
  const AllTicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingButtons(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
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
                  // const Divider(
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
              height: 24,
            ),
            const Flexible(
              child: TicketsList(),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
