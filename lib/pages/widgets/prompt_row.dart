import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/pages/widgets/prompt_row_item.dart';

class PromptRow extends StatelessWidget {
  const PromptRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        PromptRowItem(
          text: 'Complex',
          color: AppColors.green,
          assetName: 'assets/icons/complex.svg',
        ),
        PromptRowItem(
          text: 'Anywhere',
          color: AppColors.blue,
          assetName: 'assets/icons/anywhere.svg',
        ),
        PromptRowItem(
          text: 'Weekend',
          color: AppColors.blueDark,
          assetName: 'assets/icons/calendar.svg',
        ),
        PromptRowItem(
          text: 'Hot tickets',
          color: AppColors.red,
          assetName: 'assets/icons/hot.svg',
        ),
      ],
    );
  }
}
