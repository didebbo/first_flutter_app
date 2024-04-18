// ignore_for_file: unused_import
import 'package:flutter/material.dart';

import 'package:first_flutter_app/Models/item.dart';
import 'package:first_flutter_app/Pages/HomePage/view.dart';
import 'package:first_flutter_app/Pages/HomePage/view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Favourite Friends",
      home: HomePageView(viewModel: homepageViewModel()),
    );
  }

  HomePageViewModel homepageViewModel() => HomePageViewModel(
      appBarTitle: "My Favorite Friends",
      appBarColor: Colors.pink.shade50,
      items: Items.items);
}
