import 'package:flutter/material.dart';

class SlideOpacityAnimation {
  late AnimationController controller;

  Animation<Offset> animationOffset(Animation<double> parent) {
    return Tween<Offset>(
      begin: const Offset(0, -0.2),
      end: const Offset(0, 0),
    ).animate(parent);
  }

  Animation<double> animationOpacity(Animation<double> parent) {
    return Tween<double>(begin: 0, end: 1).animate(parent);
  }

  FadeTransition _fadeTransition(Animation<double> parent, Widget child) {
    return FadeTransition(opacity: animationOpacity(parent), child: child);
  }

  SlideTransition _slideTransition(Animation<double> parent, Widget child) {
    return SlideTransition(position: animationOffset(parent), child: child);
  }

  Widget fadeAndSlideTransition(Animation<double> parent, Widget child) {
    return _fadeTransition(parent, _slideTransition(parent, child));
  }

  Widget fadeTransition(Animation<double> parent, Widget child) {
    return _fadeTransition(parent, child);
  }

  Widget slideTransition(Animation<double> parent, Widget child) {
    return _slideTransition(parent, child);
  }
}
