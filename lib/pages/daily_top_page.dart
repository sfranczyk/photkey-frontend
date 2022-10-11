import 'package:flutter/material.dart';
import 'package:photkey/utils/custom_default_app_bar.dart';

import '../models/photo.dart';
import '../providers/header_text.dart';

class DailyTopPage extends StatefulWidget {
  const DailyTopPage({Key? key}) : super(key: key);

  @override
  State<DailyTopPage> createState() => _DailyTopPageState();
}

class _DailyTopPageState extends State<DailyTopPage> {
  List<Photo> models = [];

  @override
  Widget build(BuildContext context) {
    models = [
      Photo('Adam', 'coffee', 'Wrocław', 2138, 'Small morning coffee.',
          'assets/images/coffee1.jpg'),
      Photo('Susann', 'coffee', 'Wrocław', 1654, 'Big noon coffee.',
          'assets/images/coffee2.png'),
      Photo('Mi', 'coffee', 'Wrocław', 1380, 'Coffee with milk.',
          'assets/images/coffee3.jpg'),
      Photo('Charles King', 'coffee', 'Wrocław', 1295, 'My coffee.',
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
                HeaderText('Daily ', Colors.grey),
                HeaderText('Top', Colors.purple),
              ],
            ),
          ),
          Flexible(
            child: GridView.count(
              crossAxisCount: 1,
              childAspectRatio: 1.5,
              mainAxisSpacing: 8,
              children: models.asMap().entries.map((entry) {
                int idx = entry.key;
                Photo photo = entry.value;

                return photoItem(photo, idx);
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget photoItem(Photo photo, int index) {
    var isPictureRight = index % 2 == 0;

    double leftMargin = isPictureRight ? 8 : 16;
    double rightMargin = isPictureRight ? 16 : 8;

    List<Widget> elements = [
      Expanded(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 8.0, left: 16, right: 16, bottom: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${index + 1}. ${photo.name}',
                  style: const TextStyle(fontSize: 28)),
              Text('by ${photo.author}',
                  style: TextStyle(fontSize: 18, color: Colors.grey[700])),
              Text(photo.location,
                  style: const TextStyle(fontSize: 18, color: Colors.grey)),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Text(photo.info,
                    style: const TextStyle(fontSize: 18, color: Colors.grey)),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: isPictureRight
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.favorite,
                    size: 16,
                    color: Colors.red,
                  ),
                  Text(' ${photo.likes}'),
                ],
              ),
            ],
          ),
        ),
      ),
      Expanded(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                    left: leftMargin, right: rightMargin, top: 8, bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 0,
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                      image: AssetImage(photo.urlImage), fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
      ),
    ];

    return Row(
      children: isPictureRight ? elements : elements.reversed.toList(),
    );
  }
}
