import 'package:flutter/material.dart';
import 'package:photkey/providers/header_text.dart';

import '../models/photo.dart';
import '../utils/custom_default_app_bar.dart';
import '../utils/photo_select_card.dart';

class SelectFavouritePage extends StatefulWidget {
  const SelectFavouritePage({Key? key}) : super(key: key);

  @override
  State<SelectFavouritePage> createState() => _SelectFavouritePageState();
}

class _SelectFavouritePageState extends State<SelectFavouritePage> {
  List<Photo> models = [];

  @override
  Widget build(BuildContext context) {
    models = [
      Photo('Mi', 'coffee', 'Wrocław', 1380, 23, 'Coffee with milk.',
          'assets/images/coffee3.jpg'),
      Photo('Charles King', 'coffee', 'Wrocław', 1295, 234, 'My coffee.',
          'assets/images/coffee1.jpg'),
      Photo('Susann', 'coffee', 'Wrocław', 1654, 3245, 'Big noon coffee.',
          'assets/images/coffee2.png'),
      Photo('Charles King', 'coffee', 'Wrocław', 1295, 2345, 'My coffee.',
          'assets/images/coffee4.jpg'),
      Photo('Adam', 'coffee', 'Wrocław', 2138, 3344, 'Small morning coffee.',
          'assets/images/coffee1.jpg'),
      Photo('Susann', 'coffee', 'Wrocław', 1654, 34, 'Big noon coffee.',
          'assets/images/coffee2.png'),
      Photo('Mi', 'coffee', 'Wrocław', 1380, 3455, 'Coffee with milk.',
          'assets/images/coffee3.jpg'),
      Photo('Charles King', 'coffee', 'Wrocław', 1295, 355, 'My coffee.',
          'assets/images/coffee4.jpg'),
    ];

    return Scaffold(
      appBar: const CustomDefaultAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
            child: Row(
              children: const [
                HeaderText('Your ', Colors.grey),
                HeaderText('keys', Colors.purple),
              ],
            ),
          ),
          Flexible(
            child: GridView.count(
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              mainAxisSpacing: 4,
              crossAxisSpacing: 2,
              children: models.map((Photo photo) {
                return PhotoSelectCard(photo: photo);
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
