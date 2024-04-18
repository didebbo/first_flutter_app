import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'dart:math';

class Item {
  final String id = const Uuid().v4();
  Color avatarColor;
  String name;
  String subTitle() => 'Ciao Sono $name';
  bool isFavorite;

  Item(
      {required this.avatarColor,
      required this.name,
      required this.isFavorite});
}

class Items {
  static List<Item> items = [
    Item(
      avatarColor: Colors.red,
      name: "Mario Rossi",
      isFavorite: false,
    ),
    Item(
      avatarColor: Colors.green,
      name: "Giuseppe Verdi",
      isFavorite: false,
    ),
  ];

  static List<String> names = [
    "Giovanni",
    "Francesco",
    "Alessandro",
    "Matteo",
    "Lorenzo",
    "Davide",
    "Riccardo",
    "Fabio",
    "Simone",
    "Filippo"
  ];

  static List<String> surnames = [
    "Ricci",
    "Moretti",
    "Galli",
    "Ferrari",
    "Esposito",
    "Romano",
    "Conti",
    "De Luca",
    "Bruno",
    "Marchetti"
  ];

  static Item getRandomItem() {
    String name = names[Random().nextInt(names.length)];
    String surname = surnames[Random().nextInt(surnames.length)];
    Color avatarColor =
        Colors.primaries[Random().nextInt(Colors.primaries.length)];
    return Item(
        avatarColor: avatarColor, name: "$name $surname", isFavorite: false);
  }
}
