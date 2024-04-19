import 'package:flutter/material.dart';

class TransitionProvider {
  static Animation<Offset> _positionAnimation(Animation<double> animation) {
    return Tween<Offset>(
      begin: const Offset(-0.2, 0),
      end: const Offset(0, 0),
    ).animate(animation);
  }

  static Animation<double> _opacityAnimation(Animation<double> animation) {
    return Tween<double>(begin: 0, end: 1).animate(animation);
  }

  static Animation<double> _sizeAnimation(Animation<double> animation) {
    return Tween<double>(begin: 0, end: 1).animate(animation);
  }

  static Widget slideTransition(Animation<double> animation, Widget child) {
    return SlideTransition(
      position: _positionAnimation(animation),
      child: child,
    );
  }

  static Widget fadeTransition(Animation<double> animation, Widget child) {
    return FadeTransition(
      opacity: _opacityAnimation(animation),
      child: child,
    );
  }

  static Widget sizeTransition(Animation<double> animation, Widget child) {
    return SizeTransition(sizeFactor: _sizeAnimation(animation), child: child);
  }

  static Widget fadeAndSlideTransition(
      Animation<double> animation, Widget child) {
    return fadeTransition(animation, slideTransition(animation, child));
  }

  static Widget fadeAndSizeTransition(
      Animation<double> animation, Widget child) {
    return fadeTransition(animation, sizeTransition(animation, child));
  }
}
