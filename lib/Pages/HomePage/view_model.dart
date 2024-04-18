import 'package:first_flutter_app/Widgets/Animations/animation_provider.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/Models/item.dart';
import 'package:logger/logger.dart';

class HomePageViewModel {
  HomePageViewModel(
      {required this.appBarTitle,
      required this.appBarColor,
      required this.items});

  final String appBarTitle;
  final Color appBarColor;
  List<Item> items;

  final Logger logger = Logger();

  final GlobalKey<AnimatedListState> animatedListKey = GlobalKey();

  insertItem(Item item, int at, [int milliseconds = 0]) {
    logger.d("insertItem at $at position");
    items.insert(at, item);
    animatedListKey.currentState
        ?.insertItem(at, duration: Duration(milliseconds: milliseconds));
  }

  removeItem(Item item, Widget widget) {
    var index = items.indexWhere((element) => element.id == item.id);
    animatedListKey.currentState?.removeItem(index, (context, animation) {
      items.removeAt(index);
      return AnimationProvider()
          .fadeOutAndSlideOutTransition(animation, widget);
    });
  }

  addRandomItem() {
    var item = Items.getRandomItem();
    var at = items.length;
    insertItem(item, at, 200);
  }

  addItem({required String name, required String surname}) {
    var item = Item(
        avatarColor: Items.randomColor(),
        name: name,
        surname: surname,
        isFavorite: false);
    var at = items.length;
    insertItem(item, at, 200);
  }

  onPressFavoriteIcon(Item forItem) {
    items = items.map((element) {
      if (forItem.id != element.id) {
        return element;
      }
      var newelement = element;
      newelement.isFavorite = !newelement.isFavorite;
      return newelement;
    }).toList();
  }

  onPressDeleteIcon(Item forItem, Widget onWidget) {
    removeItem(forItem, onWidget);
  }
}
