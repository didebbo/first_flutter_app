import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  const InputField({super.key, required this.onConfirm});

  final Function(String) onConfirm;

  @override
  State<StatefulWidget> createState() {
    return _InputField();
  }
}

class _InputField extends State<InputField> {
  String name = "";
  String surname = "";

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        right: 0,
        left: 0,
        child: Container(
          height: 85,
          padding: const EdgeInsets.all(20),
          color: Colors.pink[100],
          child: Row(children: [
            inputField("Nome", setName),
            inputField("Cognome", setSurname),
            confirmButton()
          ]),
        ));
  }

  Widget inputField(String label, Function(String) onChanged) {
    return Expanded(
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
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
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.pink.shade400, width: 1.2),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  fillColor: Colors.white),
              onChanged: onChanged,
            )));
  }

  Widget confirmButton() {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: IconButton(
            onPressed: onConfirmButton,
            icon: Icon(color: Colors.pink[50], Icons.send)));
  }

  setName(String str) => name = str;
  setSurname(String str) => surname = str;
  onConfirmButton() {
    if (name.isNotEmpty && surname.isNotEmpty) {
      widget.onConfirm("$name $surname");
    }
  }
}
