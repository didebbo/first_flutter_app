import 'package:first_flutter_app/Models/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlideInItemListWidget extends StatelessWidget {
  const SlideInItemListWidget(
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
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(children: [avatarIcon(), infoColumn(), actions()]));
  }

  Widget avatarIcon() {
    return Container(
        padding: EdgeInsets.all(5),
        child: CircleAvatar(
          backgroundColor: item.avatarColor,
          radius: 20,
        ));
  }

  Widget infoColumn() {
    return Expanded(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(item.name), Text(item.subTitle())]));
  }

  Widget actions() {
    return Row(children: [favouriteIcon(), deleteIcon()]);
  }

  IconButton favouriteIcon() {
    return IconButton(
        onPressed: onPressFavoriteIcon,
        icon: Icon(Icons.favorite,
            color: item.isFavorite ? Colors.red[400] : Colors.grey));
  }

  IconButton deleteIcon() {
    return IconButton(
        onPressed: onPressDeleteIcon,
        icon: Icon(Icons.delete, color: Colors.pink[800]));
  }
}
