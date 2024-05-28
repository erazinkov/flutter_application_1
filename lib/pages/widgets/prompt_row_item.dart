import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PromptRowItem extends StatelessWidget {
  const PromptRowItem({
    super.key,
    required this.color,
    required this.assetName,
    required this.text,
    required this.onTap,
  });

  final Color color;
  final String assetName;
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset(
              assetName,
              width: 24,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
