import 'package:flutter/cupertino.dart';

class MyAnimationUp extends PageRouteBuilder {
  final Widget page;

  MyAnimationUp({required this.page})
      : super(
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.easeInOutCubicEmphasized);
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                  ).animate(animation),
                child: child,
              );
            },
            pageBuilder: ((context, animation, secondaryAnimation) {
              return page;
            }));
}
