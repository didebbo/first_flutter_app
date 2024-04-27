import 'package:first_flutter_app/Utils/logger.dart';
import 'package:first_flutter_app/Utils/sqlite_database_manager.dart';
import 'package:first_flutter_app/Widgets/Animations/transaction_provider.dart';
import 'package:first_flutter_app/Widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/Models/item.dart';
import 'package:uuid/uuid.dart';

class HomePageViewModel {
  HomePageViewModel({required this.appBarTitle, required this.appBarColor}) {
    fetchData();
  }

  final String appBarTitle;
  final Color appBarColor;
  late Future<void> fetchingData;
  late List<Item> items;

  final GlobalKey<AnimatedListState> animatedListKey = GlobalKey();
  bool editMode = false;

  fetchData() async =>
      fetchingData = Future.delayed(const Duration(seconds: 2), () async {
        items = await DatabaseManager.readItems();
      });

  insertItem(Item item, int at, [int milliseconds = 0]) {
    LogManager.debug("insertItem at $at position");
    items.insert(at, item);
    DatabaseManager.insertItem(item);
    animatedListKey.currentState
        ?.insertItem(at, duration: Duration(milliseconds: milliseconds));
  }

  removeItem(Animation<double> animation, Item item) {
    var index = items.indexWhere((element) => element.id == item.id);
    items.removeAt(index);
    DatabaseManager.deleteItem(item.id);
    animatedListKey.currentState?.removeItem(index, (context, animation) {
      return TransitionProvider.fadeAndSizeTransition(
          animation,
          AnimatedListItemView(
              item: item,
              onPressFavoriteIcon: () {},
              onPressDeleteIcon: () {}));
    });
  }

  addItem({required String name, required String surname}) {
    var item = Item(
        id: const Uuid().v4(),
        avatarColor: Item.randomColor(),
        name: name,
        surname: surname,
        isFavorite: false);
    var at = items.length;
    insertItem(item, at, 200);
    setEditMode(false);
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

  onPressDeleteIcon(Animation<double> animation, Item item) {
    removeItem(animation, item);
  }

  setEditMode(bool editmode) => editMode = editmode;
}
