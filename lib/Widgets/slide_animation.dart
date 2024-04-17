import 'package:flutter/material.dart';

class AnimationProvider {
  Animation<Offset> _animationOffsetIn(Animation<double> parent) {
    return Tween<Offset>(
      begin: const Offset(0, -0.2),
      end: const Offset(0, 0),
    ).animate(parent);
  }

  Animation<double> _animationOpacityIn(Animation<double> parent) {
    return Tween<double>(begin: 0, end: 1).animate(parent);
  }

  FadeTransition _fadeInTransition(Animation<double> parent, Widget child) {
    return FadeTransition(opacity: _animationOpacityIn(parent), child: child);
  }

  SlideTransition _slideInTransition(Animation<double> parent, Widget child) {
    return SlideTransition(position: _animationOffsetIn(parent), child: child);
  }

  Widget fadeInAndSlideInTransition(Animation<double> parent, Widget child) {
    return _fadeInTransition(parent, _slideInTransition(parent, child));
  }
}
