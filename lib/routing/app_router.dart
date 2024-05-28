import 'package:auto_route/auto_route.dart';
import 'package:flutter_application_1/pages/hotels_screen.dart';
import 'package:flutter_application_1/pages/brief_screen.dart';
import 'package:flutter_application_1/pages/subs_screen.dart';
import 'package:flutter_application_1/pages/profile_screen.dart';
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
            TicketsRoutes.routes,
            AutoRoute(page: HotelsRoute.page),
            AutoRoute(page: BriefRoute.page),
            AutoRoute(page: SubsRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),
      ];
}
