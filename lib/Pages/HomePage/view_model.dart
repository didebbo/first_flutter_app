import 'package:first_flutter_app/Utils/logger.dart';
import 'package:first_flutter_app/Utils/sqlite_database_manager.dart';
import 'package:first_flutter_app/Widgets/Animations/transaction_provider.dart';
import 'package:first_flutter_app/Widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/Models/item.dart';
import 'package:uuid/uuid.dart';

class HomePageViewModel {
  HomePageViewModel({required this.appBarTitle, required this.appBarColor});

  final String appBarTitle;
  final Color appBarColor;
  late Future<List<Item>> futureItems;

  final GlobalKey<AnimatedListState> animatedListKey = GlobalKey();
  bool editMode = false;

  Future<List<Item>> fetchItems() async =>
      futureItems = Future(() => DatabaseManager.readItems());

  insertItem(Item item, int at, [int milliseconds = 0]) async {
    final items = await futureItems;
    LogManager.debug("insertItem at $at position");
    items.insert(at, item);
    futureItems = Future(() => items);
    DatabaseManager.insertItem(item);
    animatedListKey.currentState
        ?.insertItem(at, duration: Duration(milliseconds: milliseconds));
  }

  removeItem(Animation<double> animation, Item item) async {
    final items = await futureItems;
    var index = items.indexWhere((element) => element.id == item.id);
    items.removeAt(index);
    futureItems = Future(() => items);
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

  addItem({required String name, required String surname}) async {
    final items = await futureItems;
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

  onPressFavoriteIcon(Item forItem) async {
    final items = await futureItems;
    futureItems = Future(() => items.map((element) {
          if (forItem.id != element.id) {
            return element;
          }
          var newelement = element;
          newelement.isFavorite = !newelement.isFavorite;
          return newelement;
        }).toList());
  }

  onPressDeleteIcon(Animation<double> animation, Item item) {
    removeItem(animation, item);
  }

  setEditMode(bool editmode) => editMode = editmode;
}
