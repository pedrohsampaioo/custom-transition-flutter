import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';

import 'package:custom_transition/screens/home_page.dart';
import 'package:custom_transition/screens/second_page.dart';
import 'package:flutter/material.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, path: '/home', initial: true),
    CustomRoute(
      page: SecondPage,
      path: '/second-page',
      transitionsBuilder: transitionsBuilder,
      durationInMilliseconds: 3000,
      reverseDurationInMilliseconds: 3000,
    ),
  ],
)
class $AppRouter {}

Route createRoute() => PageRouteBuilder(
      transitionDuration: const Duration(seconds: 3),
      pageBuilder: (context, animation, secondaryAnimation) => SecondPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final begin = Offset(0, 1);
        final end = Offset(0, 0);
        final curveTween = CurveTween(curve: Curves.easeInOut);
        final tween = Tween(begin: begin, end: end).chain(curveTween);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );

Widget transitionsBuilder(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondAnimation,
  Widget child,
) {
  final begin = Offset(0, 1);
  final end = Offset(0, 0);
  final curveTween = CurveTween(curve: Curves.easeInOut);
  final tween = Tween(begin: begin, end: end).chain(curveTween);
  final offsetAnimation = animation.drive(tween);
  return FadeTransition(opacity: animation, child: child);
}
