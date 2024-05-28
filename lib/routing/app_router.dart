import 'package:auto_route/auto_route.dart';
import 'package:flutter_application_1/pages/second_screen.dart';
import 'package:flutter_application_1/pages/root_screen.dart';
import 'package:flutter_application_1/pages/tickets_screen.dart';
import 'package:flutter_application_1/pages/tickets_wrapper_screen.dart';
import 'package:flutter_application_1/pages/tickets_routes.dart';
import 'package:flutter_application_1/pages/search_screen.dart';
import 'package:flutter_application_1/pages/country_screen.dart';
import 'package:flutter_application_1/pages/all_tickets_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: RootRoute.page,
          initial: true,
          children: [
            /// Вложенные маршруты
            TicketsRoutes.routes,
            AutoRoute(
              page: SecondRoute.page,
            ),
          ],
        ),
      ];
}
