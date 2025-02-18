import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/pages/widgets/recommendations_row_item.dart';
import 'package:flutter_application_1/data/data.dart';

class StraightRow extends StatelessWidget {
  const StraightRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.searchGreyDark,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ...recommendations.map(
            (e) => RecommendationsRowItem(
              onTap: () {},
              assetName: e.assetName,
              town: e.town,
              description: e.description,
            ),
          ),
        ],
      ),
    );
  }
}
