import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/features/search/presentation/bloc/search_cubit/search_cubit.dart';
import 'package:flutter_application_1/features/search/presentation/bloc/search_cubit/search_state.dart';
import 'package:flutter_application_1/pages/widgets/info_row_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({super.key});

  Future<void> selectDate(BuildContext context) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (newDate != null) {
      context.read<SearchCubit>().onSearchChange(
          date: DateFormat('dd MMMM, E', 'ru').format(newDate).toLowerCase());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InfoRowItem(
              onTap: () => showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime(2030),
              ),
              text: 'обратно',
              icon: const Icon(
                Icons.add,
                color: AppColors.white,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) => InfoRowItem(
                onTap: () => selectDate(context),
                text: state.search.date,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            const InfoRowItem(
              text: '1, эконом',
              icon: Icon(
                Icons.person,
                color: AppColors.greyDark,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            const InfoRowItem(
              text: '',
              icon: Icon(
                Icons.tune,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
