import 'package:auto_route/auto_route.dart';
import 'package:flutter_application_1/routing/app_router.dart';

abstract class TicketsRoutes {
  static final routes = AutoRoute(
    page: TicketsWrapperRoute.page,
    children: [
      AutoRoute(page: TicketsRoute.page, initial: true),
      AutoRoute(page: SearchRoute.page),
      AutoRoute(page: CountryRoute.page),
    ],
  );
}
