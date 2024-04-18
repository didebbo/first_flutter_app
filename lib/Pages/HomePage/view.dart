import 'package:first_flutter_app/Widgets/item_widget.dart';
import 'package:flutter/material.dart';

import 'package:first_flutter_app/Pages/HomePage/view_model.dart';
import 'package:first_flutter_app/Models/item.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key, required this.viewModel});

  final HomePageViewModel viewModel;

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: animatedListView(),
        floatingActionButton: floatingActionButton());
  }

  AppBar appBar() {
    return AppBar(
      title: Text(widget.viewModel.appBarTitle),
      backgroundColor: widget.viewModel.appBarColor,
    );
  }

  Widget animatedListView() {
    return Container(
        child: AnimatedList(
            key: widget.viewModel.animatedListKey,
            initialItemCount: widget.viewModel.items.length,
            itemBuilder: (context, index, animation) {
              var item = widget.viewModel.items[index];
              return SlideInItemListWidget(
                  context: context,
                  index: index,
                  animation: animation,
                  item: item);
            }));
  }

  ListView listView() {
    return ListView(
      children: listTileChildren(),
    );
  }

  List<Widget> listTileChildren() =>
      widget.viewModel.items.map((e) => rowTile(e)).toList();

  Widget rowTile(Item element) {
    return Padding(
        padding: const EdgeInsets.only(top: 10, left: 10),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: element.avatarColor,
              radius: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                  children: [Text(element.name), Text(element.subTitle())]),
            ),
            iconsRow(element)
          ],
        ));
  }

  ListTile listTile(Item element) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: element.avatarColor,
        radius: 20,
      ),
      title: Text(element.name),
      subtitle: Text(element.subTitle()),
      trailing: iconsRow(element),
    );
  }

  Row iconsRow(Item forItem) {
    return Row(children: [favouriteIcon(forItem), deleteIcon(forItem)]);
  }

  IconButton favouriteIcon(Item forItem) {
    onPressed() =>
        setState(() => widget.viewModel.onPressFavoriteIcon(forItem));

    return IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.favorite,
            color: forItem.isFavorite ? Colors.red[400] : Colors.grey));
  }

  IconButton deleteIcon(Item forItem) {
    onPressed() => setState(
        () => widget.viewModel.onPressDeleteIcon(forItem, rowTile(forItem)));

    return IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.delete, color: Colors.pink[800]));
  }

  FloatingActionButton floatingActionButton() {
    onPressed() => setState(() => widget.viewModel.addRandomItem());

    return FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Colors.pink[100],
        child: Icon(
          Icons.add,
          color: Colors.pink[400],
        ));
  }
}
