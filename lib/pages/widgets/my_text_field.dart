import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    this.enabled = true,
    super.key,
    this.assetName,
    required this.labelText,
    required this.controller,
    required this.readOnly,
    required this.showClear,
    this.onSwitch,
  });

  final bool readOnly;
  final bool showClear;
  final bool? enabled;
  final String? assetName;
  final String labelText;
  final TextEditingController controller;

  final void Function()? onSwitch;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      TextField(
        readOnly: readOnly,
        controller: controller,
        enabled: enabled,
        cursorColor: AppColors.searchCursor,
        obscureText: false,
        style: const TextStyle(
          color: AppColors.searchText,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        keyboardType: TextInputType.text,
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
          labelText: labelText,
          labelStyle: const TextStyle(
            color: AppColors.searchLabel,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      onSwitch != null
          ? GestureDetector(
              onTap: onSwitch,
              child: const Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.tune),
              ),
            )
          : controller.text.isNotEmpty && showClear
              ? GestureDetector(
                  onTap: () {
                    controller.clear();
                  },
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.clear),
                  ),
                )
              : const SizedBox.shrink(),
    ]);
  }
}
