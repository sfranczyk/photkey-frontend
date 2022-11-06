import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {Key? key,
      required this.text,
      required this.onClicked,
      required this.icon})
      : super(key: key);
  final String text;
  final Icon icon;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 4,
          shadowColor: Colors.teal,
          foregroundColor: Colors.white,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12)),
      onPressed: onClicked,
      child: Row(children: [
        icon,
        const SizedBox(
          width: 6,
        ),
        Text(text)
      ]),
    );
  }
}
