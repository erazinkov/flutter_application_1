import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:collection/collection.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({
    super.key,
    required this.index,
    required this.onIndexTap,
  });

  final int index;
  final void Function(int idx) onIndexTap;

  final botNavBarItemInfoList = [
    BotNavBarItemInfo(
      assetName: 'assets/icons/air_tickets.svg',
      label: 'Air Tickets',
    ),
    BotNavBarItemInfo(
      assetName: 'assets/icons/hotels.svg',
      label: 'Hotels',
    ),
    BotNavBarItemInfo(
      assetName: 'assets/icons/brief.svg',
      label: 'Brief',
    ),
    BotNavBarItemInfo(
      assetName: 'assets/icons/subscriptions.svg',
      label: 'Subs',
    ),
    BotNavBarItemInfo(
      assetName: 'assets/icons/profile.svg',
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      selectedItemColor: AppColors.navSelected,
      unselectedItemColor: AppColors.navUnselected,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      currentIndex: index,
      onTap: (idx) => onIndexTap(idx),
      items: [
        ...botNavBarItemInfoList.mapIndexed(
          (idx, element) => BottomNavigationBarItem(
            label: element.label,
            icon: SvgPicture.asset(
              element.assetName,
              colorFilter: ColorFilter.mode(
                  idx == index
                      ? AppColors.navSelected
                      : AppColors.navUnselected,
                  BlendMode.srcIn),
            ),
          ),
        )
      ],
    );
  }
}

class BotNavBarItemInfo {
  BotNavBarItemInfo({required this.assetName, required this.label});
  String assetName;
  String label;
}
