import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/pages/widgets/my_text_field.dart';
import 'package:flutter_application_1/pages/widgets/prompt_row.dart';
import 'package:flutter_application_1/pages/widgets/recommendations_row.dart';

class SearchModal extends StatelessWidget {
  const SearchModal({super.key});

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
            height: 24,
          ),
          PromptRow(),
          const SizedBox(
            height: 30,
          ),
          RecommendationsRow(),
        ],
      ),
    );
  }
}
