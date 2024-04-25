import 'package:flutter/material.dart';
import 'dart:math';

class Item {
  final String id;
  final Color avatarColor;
  final String name;
  final String surname;
  String subTitle() => 'Ciao Sono $name $surname';
  String fullname() => '$name $surname';
  String avatarName() => '${name[0].toUpperCase()}${surname[0].toUpperCase()}';
  bool isFavorite;

  Item(
      {required this.id,
      required this.avatarColor,
      required this.name,
      required this.surname,
      required this.isFavorite});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'avatarColor': avatarColor.value,
      'isFavorite': isFavorite ? 1 : 0,
    };
  }

  static Color randomColor() =>
      Colors.primaries[Random().nextInt(Colors.primaries.length)];
}
