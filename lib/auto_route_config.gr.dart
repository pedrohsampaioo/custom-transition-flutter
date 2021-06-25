// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:custom_transition/auto_route_config.dart' as _i5;
import 'package:custom_transition/screens/home_page.dart' as _i3;
import 'package:custom_transition/screens/second_page.dart' as _i4;
import 'package:flutter/material.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.HomePage();
        }),
    SecondRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.SecondPage();
        },
        transitionsBuilder: _i5.transitionsBuilder,
        durationInMilliseconds: 3000,
        reverseDurationInMilliseconds: 3000,
        opaque: true,
        barrierDismissible: false)
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig('/#redirect',
            path: '/', redirectTo: '/home', fullMatch: true),
        _i1.RouteConfig(HomeRoute.name, path: '/home'),
        _i1.RouteConfig(SecondRoute.name, path: '/second-page')
      ];
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '/home');

  static const String name = 'HomeRoute';
}

class SecondRoute extends _i1.PageRouteInfo {
  const SecondRoute() : super(name, path: '/second-page');

  static const String name = 'SecondRoute';
}
