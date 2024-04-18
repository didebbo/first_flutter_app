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
            padding: const EdgeInsets.all(20),
            color: backgroundColor,
            alignment: Alignment.center,
            child: Row(children: [inputField("Nome")])));
  }

  Widget inputField(String label) {
    return Expanded(
        child: TextField(
            decoration: InputDecoration(
                hoverColor: Colors.yellow.withAlpha(50),
                labelText: label,
                labelStyle: TextStyle(
                  color: Colors.black.withAlpha(100),
                ),
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.pink.shade200, width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.pink.shade400, width: 1.2),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                fillColor: Colors.white)));
  }
}
