import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';

class FloatingButtons extends StatelessWidget {
  const FloatingButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(50),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                size: 16,
                Icons.tune,
                color: AppColors.white,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                'Фильтры',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 16,
          ),
          Row(
            children: [
              Icon(
                size: 16,
                Icons.leaderboard,
                color: AppColors.white,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                'Статистика',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
