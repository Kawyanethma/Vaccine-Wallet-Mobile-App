import 'package:flutter/cupertino.dart';

class MyAnimationSlide extends PageRouteBuilder {
  final Widget page;

  MyAnimationSlide({required this.page})
      : super(
            transitionDuration: const Duration(milliseconds: 1000),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.easeInOutCubicEmphasized);
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                  ).animate(animation),
                child: child,
              );
            },
            pageBuilder: ((context, animation, secondaryAnimation) {
              return page;
            }));
}
