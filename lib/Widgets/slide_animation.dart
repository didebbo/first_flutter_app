import 'package:flutter/material.dart';

class MyAnimations {
  static SlideTransition slideTransition(
      Animation<double> animation, Widget child) {
    return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: const Offset(0, 0),
        ).animate(animation),
        child: child);
  }
}
