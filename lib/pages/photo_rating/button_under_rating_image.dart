import 'package:flutter/material.dart';

class ButtonUnderRatingImage extends StatelessWidget {
  final String hint;
  final IconData icon;
  final void Function() onPressed;

  const ButtonUnderRatingImage(
      {super.key,
        required this.hint,
        required this.icon,
        required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromRadius(25),
            shape: const CircleBorder(),
            backgroundColor: Colors.white),
        child: Icon(
          icon,
          color: Colors.deepPurple,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Text(
          hint,
          style: const TextStyle(color: Colors.deepPurple),
        ),
      ),
    ]);
  }
}
