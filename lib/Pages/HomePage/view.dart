import 'package:first_flutter_app/Widgets/animated_list.dart';
import 'package:first_flutter_app/Widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/Pages/HomePage/view_model.dart';

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
      future: widget.viewModel.fetchingData,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return loader();
          default:
            return body();
        }
      });

  Widget loader() {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.pink[50],
        color: Colors.pink[100],
      ),
    );
  }

  Widget body() {
    onConfirm({required String name, required String surname}) => setState(() {
          widget.viewModel.addItem(name: name, surname: surname);
        });
    return Stack(children: [
      FadeInAnimatedListView(viewModel: widget.viewModel),
      InputField(onConfirm: onConfirm, editMode: widget.viewModel.editMode)
    ]);
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
