import 'package:flutter/material.dart';

Widget fadeAlertAnimation(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
    ) {
  return Align(
    child: FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}