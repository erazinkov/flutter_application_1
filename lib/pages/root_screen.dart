import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/routing/app_router.dart';

@RoutePage()
class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        TicketsRoute(),
        ProfileRoute(),
        SecondRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'Air Tickets',
              icon: Icon(Icons.book),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.book),
            ),
            BottomNavigationBarItem(
              label: 'Second',
              icon: Icon(Icons.book_online),
            ),
          ],
        );
      },
    );
  }
}
