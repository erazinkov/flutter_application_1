import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({this.enabled = true, super.key, this.assetName});

  final bool? enabled;
  final String? assetName;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      cursorColor: AppColors.searchCursor,
      obscureText: false,
      style: const TextStyle(
        color: AppColors.searchText,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      keyboardType: TextInputType.text,
      onChanged: (value) {},
      autocorrect: false,
      decoration: InputDecoration(
        icon: assetName != null
            ? SvgPicture.asset(
                assetName!,
                colorFilter: const ColorFilter.mode(
                  AppColors.searchLabel,
                  BlendMode.srcIn,
                ),
              )
            : null,
        isCollapsed: true,
        border: InputBorder.none,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: '123',
        labelStyle: const TextStyle(
          color: AppColors.searchLabel,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
