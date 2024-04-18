import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({super.key, required this.backgroundColor});

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        right: 0,
        left: 0,
        child: Container(
            padding: EdgeInsets.all(20),
            color: backgroundColor,
            alignment: Alignment.center,
            child: const TextField(
                decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    fillColor: Colors.white,
                    hintText: "Inputtext..."))));
  }
}
