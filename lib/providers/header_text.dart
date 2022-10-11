import 'dart:ui';

import 'package:flutter/cupertino.dart';

class HeaderText extends StatelessWidget {
  final String data;
  final Color color;

  const HeaderText(this.data, this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: 42,
        color: color,
      ),
    );
  }
}
