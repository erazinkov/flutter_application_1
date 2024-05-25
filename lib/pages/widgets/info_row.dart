import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/pages/widgets/info_row_item.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({super.key});

  Future<void> _selectDate(BuildContext context) async {
    final _newDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(202),
      lastDate: DateTime(2030),
    );
    if (_newDate != null) {}
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
              text: 'обратно',
              icon: Icon(
                Icons.add,
                color: AppColors.white,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            InfoRowItem(
              onTap: () => _selectDate(context),
              text: 'date',
            ),
            SizedBox(
              width: 8,
            ),
            InfoRowItem(
              text: '1, эконом',
              icon: Icon(
                Icons.person,
                color: AppColors.greyDark,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            InfoRowItem(
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
