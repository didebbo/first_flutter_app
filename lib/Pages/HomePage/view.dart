import 'package:first_flutter_app/Widgets/Animations/transaction_provider.dart';
import 'package:first_flutter_app/Widgets/input_field.dart';
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
  void initState() {
    super.initState();
    widget.viewModel.fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: futureBody(),
        floatingActionButton:
            !widget.viewModel.editMode ? floatingActionButton() : null);
  }

  AppBar appBar() {
    return AppBar(
      title: Text(widget.viewModel.appBarTitle),
      backgroundColor: widget.viewModel.appBarColor,
    );
  }

  Widget futureBody() => FutureBuilder(
      future: widget.viewModel.futureItems,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(child: Text("Loading..."));
          default:
            if (snapshot.hasError) {
              return const Center(child: Text("Error on fetch data"));
            } else {
              return body();
            }
        }
      });

  Widget body() {
    onConfirm({required String name, required String surname}) => setState(() {
          widget.viewModel.addItem(name: name, surname: surname);
        });
    return Stack(children: [
      animatedListView(),
      InputField(onConfirm: onConfirm, editMode: widget.viewModel.editMode)
    ]);
  }

  Widget animatedListView() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: AnimatedList(
            key: widget.viewModel.animatedListKey,
            initialItemCount: widget.viewModel.items.length,
            itemBuilder: (context, index, animation) {
              var item = widget.viewModel.items[index];
              return animatedListItemView(animation, item);
            }));
  }

  Widget animatedListItemView(Animation<double> animation, Item item) {
    return TransitionProvider.fadeAndSlideTransition(
      animation,
      AnimatedListItemView(
        item: item,
        onPressFavoriteIcon: () =>
            setState(() => widget.viewModel.onPressFavoriteIcon(item)),
        onPressDeleteIcon: () => setState(
          () => widget.viewModel.onPressDeleteIcon(animation, item),
        ),
      ),
    );
  }

  FloatingActionButton floatingActionButton() {
    onPressed() => setState(() => widget.viewModel.setEditMode(true));

    return FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Colors.pink[100],
        child: Icon(
          Icons.add,
          color: Colors.pink[400],
        ));
  }
}
