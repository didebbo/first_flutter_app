import 'package:first_flutter_app/Widgets/slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/Models/item_model.dart';
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
    items.removeAt(index);
    animatedListKey.currentState?.removeItem(
        index,
        (context, animation) => AnimationProvider()
            .fadeOutAndSlideOutTransition(animation, widget));
  }

  addRandomItem() {
    var item = Items.getRandomItem();
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
