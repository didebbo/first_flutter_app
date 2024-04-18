import 'package:first_flutter_app/Models/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SlideInItemListWidget extends StatelessWidget {
  const SlideInItemListWidget(
      {super.key,
      required this.context,
      required this.index,
      required this.animation,
      required this.item});

  final BuildContext context;
  final int index;
  final Animation<double> animation;
  final Item item;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(animation),
        child: fadeInSlideIn());
  }

  Widget fadeInSlideIn() {
    return FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(animation),
        child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-0.2, 0),
              end: const Offset(0, 0),
            ).animate(animation),
            child: row()));
  }

  Widget row() {
    return Row(children: [infoColumn()]);
  }

  Widget infoColumn() {
    return Column(children: [Text(item.name), Text(item.subTitle())]);
  }
}
