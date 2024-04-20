import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'dart:math';

class Item {
  final String id = const Uuid().v4();
  final Color avatarColor;
  final String name;
  final String surname;
  String subTitle() => 'Ciao Sono $name $surname';
  String fullname() => '$name $surname';
  String avatarName() => '${name[0].toUpperCase()}${surname[0].toUpperCase()}';
  bool isFavorite;

  Item(
      {required this.avatarColor,
      required this.name,
      required this.surname,
      required this.isFavorite});
}

class Items {
  static List<Item> items = [
    Item(
      avatarColor: Colors.red,
      name: "Mario",
      surname: "Rossi",
      isFavorite: true,
    ),
    Item(
      avatarColor: Colors.green,
      name: "Giuseppe",
      surname: "Verdi",
      isFavorite: false,
    ),
    Item(
      avatarColor: Colors.orange,
      name: "Francesco",
      surname: "Moretti",
      isFavorite: true,
    ),
    Item(
      avatarColor: Colors.cyan,
      name: "Alessandro",
      surname: "Ferrari",
      isFavorite: false,
    ),
    Item(
      avatarColor: Colors.purple,
      name: "Fabio",
      surname: "Bruno",
      isFavorite: true,
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
    Color avatarColor = randomColor();
    return Item(
        avatarColor: avatarColor,
        name: name,
        surname: surname,
        isFavorite: false);
  }

  static Color randomColor() =>
      Colors.primaries[Random().nextInt(Colors.primaries.length)];
}
