import 'package:flutter/material.dart';

class SlideRight extends PageRouteBuilder {
  final Page;
  SlideRight({this.Page})
      : super(
          pageBuilder: (context, animation, animationtwo) => Page,
          transitionsBuilder: (context, animation, animationtwo, child) {
            var begin = Offset(1, 0);
            var end = Offset(0, 0);
            var tween = Tween(begin: begin, end: end);
            //
            var begin2 = 0.0;
            var end2 = 1.0;
            var tween2 = Tween(begin: begin2, end: end2);
            //
            var curveanimation =
                CurvedAnimation(parent: animation, curve: Curves.linear);
            //
            return ScaleTransition(
              scale: tween2.animate(curveanimation),
              child: child,
            );
          },
        );
}

class GameToWinner extends PageRouteBuilder {
  final Page;
  GameToWinner({this.Page})
      : super(
          pageBuilder: (context, animation, animationtwo) => Page,
          transitionsBuilder: (context, animation, animationtwo, child) {
            // var begin = Offset(1, 0);
            // var end = Offset(0, 0);
            //var tween = Tween(begin: begin, end: end);
            //
            var begin2 = 0.0;
            var end2 = 1.0;
            var tween2 = Tween(begin: begin2, end: end2);
            //
            var curveanimation =
                CurvedAnimation(parent: animation, curve: Curves.linear);
            //
            return RotationTransition(
              turns: tween2.animate(curveanimation),
              child: ScaleTransition(
                scale: tween2.animate(curveanimation),
                child: child,
              ),
            );
          },
        );
}
