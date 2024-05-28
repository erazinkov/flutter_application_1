import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';

@RoutePage()
class HotelsScreen extends StatelessWidget {
  const HotelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Hotels',
          style: TextStyle(color: AppColors.white),
        ),
      ),
    );
  }
}
