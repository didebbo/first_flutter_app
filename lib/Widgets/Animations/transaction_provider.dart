import 'package:flutter/material.dart';

class TransitionProvider {
  static Animation<Offset> _positionAnimation(Animation<double> animation) {
    return Tween<Offset>(
      begin: const Offset(-0.2, 0),
      end: const Offset(0, 0),
    ).animate(animation);
  }

  static Animation<double> _opacityFadeInAnimation(
      Animation<double> animation) {
    return Tween<double>(begin: 1, end: 0).animate(animation);
  }

  static Animation<double> _opacityFadeOutAnimation(
      Animation<double> animation) {
    return Tween<double>(begin: 0, end: 1).animate(animation);
  }

  static Widget slideTransaction(Animation<double> animation, Widget child) {
    return SlideTransition(
      position: _positionAnimation(animation),
      child: child,
    );
  }

  static Widget fadeInTransition(Animation<double> animation, Widget child) {
    return FadeTransition(
      opacity: _opacityFadeInAnimation(animation),
      child: child,
    );
  }

  static Widget fadeOutTransition(Animation<double> animation, Widget child) {
    return FadeTransition(
      opacity: _opacityFadeOutAnimation(animation),
      child: child,
    );
  }

  static Widget fadeInAndSlideInTransition(
      Animation<double> animation, Widget child) {
    return fadeInTransition(animation, slideTransaction(animation, child));
  }

  static Widget fadeOutAndSlideOutTransition(
      Animation<double> animation, Widget child) {
    return fadeOutTransition(animation, slideTransaction(animation, child));
  }
}
