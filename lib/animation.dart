import 'package:flutter/material.dart';

class SlideRight extends PageRouteBuilder {
  final Widget page;
  SlideRight({required this.page})
      : super(
          pageBuilder: (context, animation, animationtwo) => page,
          transitionsBuilder: (context, animation, animationtwo, child) {
            var begin = 0.0;
            var end = 1.0;
            var tween = Tween(begin: begin, end: end);
            //
            var curveanimation =
                CurvedAnimation(parent: animation, curve: Curves.linear);
            //
            return ScaleTransition(
              scale: tween.animate(curveanimation),
              child: child,
            );
          },
        );
}

class GameToWinner extends PageRouteBuilder {
  final Widget page;
  GameToWinner({required this.page})
      : super(
          pageBuilder: (context, animation, animationtwo) => page,
          transitionsBuilder: (context, animation, animationtwo, child) {
            double begin = 0.0;
            double end2 = 1.0;
            Tween<double> tween = Tween(begin: begin, end: end2);
            //
            CurvedAnimation curveanimation =
                CurvedAnimation(parent: animation, curve: Curves.linear);
            //
            return RotationTransition(
              turns: tween.animate(curveanimation),
              child: ScaleTransition(
                scale: tween.animate(curveanimation),
                child: child,
              ),
            );
          },
        );
}
