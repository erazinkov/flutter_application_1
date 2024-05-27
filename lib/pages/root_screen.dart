import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/routing/app_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
    return AutoTabsScaffold(
      resizeToAvoidBottomInset: false,
      routes: const [
        TicketsWrapperRoute(),
        SecondRoute(),
        SecondRoute(),
        SecondRoute(),
        SecondRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedItemColor: AppColors.navSelected,
          unselectedItemColor: AppColors.navUnselected,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            ...botNavBarItemInfoList.mapIndexed(
              (idx, element) => BottomNavigationBarItem(
                label: element.label,
                icon: SvgPicture.asset(
                  element.assetName,
                  colorFilter: ColorFilter.mode(
                      idx == tabsRouter.activeIndex
                          ? AppColors.navSelected
                          : AppColors.navUnselected,
                      BlendMode.srcIn),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class BotNavBarItemInfo {
  BotNavBarItemInfo({required this.assetName, required this.label});
  String assetName;
  String label;
}
