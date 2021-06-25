import 'package:auto_route/auto_route.dart';
import 'package:custom_transition/auto_route_config.gr.dart';
import 'package:custom_transition/screens/second_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          GestureDetector(
            onTap: () => AutoRouter.of(context).push(SecondRoute()),
            child: Hero(
              tag: Key('image'),
              child: Image.network(
                'https://c4.wallpaperflare.com/wallpaper/168/493/80/borneo-orangutan-tanjung-puting-national-park-indonesia-wallpaper-preview.jpg',
                fit: BoxFit.cover,
                width: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }

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
}
