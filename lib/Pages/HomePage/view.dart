import 'package:flutter/material.dart';

import 'view_model.dart';
import '/Models/item_model.dart';

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
        body: animatedListView(context),
        floatingActionButton: floatingActionButton());
  }

  AppBar appBar() {
    return AppBar(
      title: Text(widget.viewModel.appBarTitle),
      backgroundColor: widget.viewModel.appBarColor,
    );
  }

  AnimatedList animatedListView(context) {
    return AnimatedList(
      key: widget.viewModel.animatedListKey,
      itemBuilder: (context, index, animation) {
        var e = widget.viewModel.items[index];
        return SizeTransition(sizeFactor: animation, child: listTile(e));
      },
    );
  }

  ListView listView() {
    return ListView(
      children: listTileChildren(),
    );
  }

  List<ListTile> listTileChildren() =>
      widget.viewModel.items.map((e) => listTile(e)).toList();

  ListTile listTile(element) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: element.avatarColor,
        radius: 20,
      ),
      title: Text(element.name),
      subtitle: Text(element.subTitle()),
      trailing: iconFavourite(element),
    );
  }

  IconButton iconFavourite(Item forItem) {
    onPressed() =>
        setState(() => widget.viewModel.onPressIconFavorite(forItem));

    return IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.favorite,
            color: forItem.isFavorite ? Colors.red[400] : Colors.grey));
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
