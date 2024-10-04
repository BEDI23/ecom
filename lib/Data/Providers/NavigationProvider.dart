import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  void navigateWithFade(BuildContext context, Widget page) {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        const curve = Curves.easeIn;

        var tween = Tween<double>(begin: begin, end: end).chain(CurveTween(curve: curve));
        var opacity = tween.animate(CurvedAnimation(parent: animation, curve: curve));

        return FadeTransition(
          opacity: opacity,
          child: child,
        );
      },
      transitionDuration: const Duration(seconds: 1),
    ));
  }
}
