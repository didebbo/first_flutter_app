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
            child: TextField(
                decoration: InputDecoration(
                    prefix: const Text("Nome: "),
                    suffixIcon: Container(
                        decoration: BoxDecoration(
                            color: Colors.pink[100],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: const Icon(Icons.add)),
                    filled: true,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    fillColor: Colors.white,
                    hintText: "Inputtext..."))));
  }
}
