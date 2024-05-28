import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/features/search/presentation/bloc/search_cubit/search_cubit.dart';
import 'package:flutter_application_1/pages/widgets/recommendations_row_item.dart';
import 'package:flutter_application_1/data/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendationsRow extends StatelessWidget {
  const RecommendationsRow({super.key});

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
              onTap: () =>
                  context.read<SearchCubit>().onSearchChange(to: e.town),
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
