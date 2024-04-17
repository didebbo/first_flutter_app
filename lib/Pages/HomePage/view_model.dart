import 'package:flutter/material.dart';
import 'package:first_flutter_app/Models/item_model.dart';
import 'package:logger/logger.dart';

class HomePageViewModel {
  HomePageViewModel({required this.appBarTitle, required this.appBarColor});

  final String appBarTitle;
  final Color appBarColor;
  List<Item> items = [];

  final Logger logger = Logger();

  final GlobalKey<AnimatedListState> animatedListKey = GlobalKey();

  insertItem(Item item, int at) {
    if (animatedListKey.currentState != null) {
      logger.d("insertItem at $at position");
      items.insert(at, item);
      animatedListKey.currentState
          ?.insertItem(at, duration: const Duration(milliseconds: 200));
    }
  }

  setItems() {
    items.asMap().forEach((index, element) {
      insertItem(element, index);
    });
  }

  addRandomItem() {
    var item = Items.getRandomItem();
    var at = items.length;
    insertItem(item, at);
  }

  onPressIconFavorite(Item forItem) {
    items = items.map((element) {
      if (forItem.id != element.id) {
        return element;
      }
      var newelement = element;
      newelement.isFavorite = !newelement.isFavorite;
      return newelement;
    }).toList();
  }
}
