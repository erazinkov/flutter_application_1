import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';

class InfoRowItem extends StatelessWidget {
  const InfoRowItem({super.key, required this.text, this.icon, this.onTap});

  final String text;
  final Icon? icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.searchGreyDark,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            icon ?? const SizedBox.shrink(),
            Text(
              text,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            )
          ],
        ),
      ),
    );
  }
}
