import 'package:first_flutter_app/Models/item.dart';
import 'package:flutter/material.dart';

class AnimatedListItemView extends StatelessWidget {
  const AnimatedListItemView(
      {super.key,
      required this.context,
      required this.index,
      required this.animation,
      required this.item,
      required this.onPressFavoriteIcon,
      required this.onPressDeleteIcon});

  final BuildContext context;
  final int index;
  final Animation<double> animation;
  final Item item;

  final VoidCallback onPressFavoriteIcon;
  final VoidCallback onPressDeleteIcon;

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
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
        child: Row(children: [avatarIcon(), infoColumn(), actions()]));
  }

  Widget avatarIcon() {
    return Container(
        padding: const EdgeInsets.only(right: 20),
        child: CircleAvatar(
          backgroundColor: item.avatarColor,
          radius: 20,
        ));
  }

  Widget infoColumn() {
    return Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          item.name),
      Text(
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black45),
          item.subTitle())
    ]));
  }

  Widget actions() {
    return Row(children: [favouriteIcon(), deleteIcon()]);
  }

  IconButton favouriteIcon() {
    return IconButton(
        onPressed: onPressFavoriteIcon,
        icon: Icon(Icons.favorite,
            color: item.isFavorite ? Colors.pink[200] : Colors.pink[50]));
  }

  IconButton deleteIcon() {
    return IconButton(
        onPressed: onPressDeleteIcon,
        icon: Icon(Icons.delete, color: Colors.pink[100]));
  }
}
