import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const BlueButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 2,
            backgroundColor: Colors.blue,
            shape: const StadiumBorder()),
        onPressed: onPressed,
        child: const Padding(
          padding: EdgeInsets.all(14.0),
          child: Center(
            child: Text("Ingrese",
                style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
        ));
  }
}
