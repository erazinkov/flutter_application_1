// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AllTicketsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AllTicketsScreen(),
      );
    },
    CountryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CountryScreen(),
      );
    },
    RootRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RootScreen(),
      );
    },
    SearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchScreen(),
      );
    },
    SecondRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SecondScreen(),
      );
    },
    TicketsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TicketsScreen(),
      );
    },
    TicketsWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const TicketsWrapperScreen()),
      );
    },
  };
}

/// generated route for
/// [AllTicketsScreen]
class AllTicketsRoute extends PageRouteInfo<void> {
  const AllTicketsRoute({List<PageRouteInfo>? children})
      : super(
          AllTicketsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllTicketsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CountryScreen]
class CountryRoute extends PageRouteInfo<void> {
  const CountryRoute({List<PageRouteInfo>? children})
      : super(
          CountryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CountryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RootScreen]
class RootRoute extends PageRouteInfo<void> {
  const RootRoute({List<PageRouteInfo>? children})
      : super(
          RootRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SecondScreen]
class SecondRoute extends PageRouteInfo<void> {
  const SecondRoute({List<PageRouteInfo>? children})
      : super(
          SecondRoute.name,
          initialChildren: children,
        );

  static const String name = 'SecondRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TicketsScreen]
class TicketsRoute extends PageRouteInfo<void> {
  const TicketsRoute({List<PageRouteInfo>? children})
      : super(
          TicketsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TicketsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TicketsWrapperScreen]
class TicketsWrapperRoute extends PageRouteInfo<void> {
  const TicketsWrapperRoute({List<PageRouteInfo>? children})
      : super(
          TicketsWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'TicketsWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
