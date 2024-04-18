import 'package:first_flutter_app/Widgets/item_widget.dart';
import 'package:flutter/material.dart';

import 'package:first_flutter_app/Pages/HomePage/view_model.dart';
import 'package:first_flutter_app/Models/item.dart';
import 'package:flutter/widgets.dart';

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
        body: body(),
        floatingActionButton: floatingActionButton());
  }

  AppBar appBar() {
    return AppBar(
      title: Text(widget.viewModel.appBarTitle),
      backgroundColor: widget.viewModel.appBarColor,
    );
  }

  Widget body() {
    return Stack(children: [animatedListView(), inputField()]);
  }

  Widget animatedListView() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: AnimatedList(
            key: widget.viewModel.animatedListKey,
            initialItemCount: widget.viewModel.items.length,
            itemBuilder: (context, index, animation) {
              var item = widget.viewModel.items[index];
              return animatedListItemView(context, index, animation, item);
            }));
  }

  Widget inputField() {
    return Positioned(
        bottom: 0,
        right: 0,
        left: 0,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            color: Colors.transparent,
            alignment: Alignment.center,
            child: const TextField(
                decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    fillColor: Colors.white,
                    hintText: "Inputtext..."))));
  }

  AnimatedListItemView animatedListItemView(
      BuildContext context, int index, Animation<double> animation, Item item) {
    return AnimatedListItemView(
      context: context,
      index: index,
      animation: animation,
      item: item,
      onPressFavoriteIcon: () =>
          setState(() => widget.viewModel.onPressFavoriteIcon(item)),
      onPressDeleteIcon: () => setState(() => widget.viewModel
          .onPressDeleteIcon(
              item, animatedListItemView(context, index, animation, item))),
    );
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
