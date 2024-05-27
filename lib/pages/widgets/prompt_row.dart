import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/features/search/presentation/bloc/search_cubit/search_cubit.dart';
import 'package:flutter_application_1/pages/widgets/prompt_row_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PromptRow extends StatelessWidget {
  const PromptRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        PromptRowItem(
          onTap: () {},
          text: 'Сложный',
          color: AppColors.green,
          assetName: 'assets/icons/complex.svg',
        ),
        PromptRowItem(
          onTap: () {
            print('Click');
            context.read<SearchCubit>().onSearchChange(to: 'Куда угодно');
          },
          text: 'Куда угодно',
          color: AppColors.blue,
          assetName: 'assets/icons/anywhere.svg',
        ),
        PromptRowItem(
          onTap: () {},
          text: 'Выходные',
          color: AppColors.blueDark,
          assetName: 'assets/icons/calendar.svg',
        ),
        PromptRowItem(
          onTap: () {},
          text: 'Горячие билеты',
          color: AppColors.red,
          assetName: 'assets/icons/hot.svg',
        ),
      ],
    );
  }
}
