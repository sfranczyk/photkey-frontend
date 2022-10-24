import 'package:flutter/material.dart';

import '../utils/custom_default_app_bar.dart';

class DailyCategoryPage extends StatelessWidget {
  final String category;

  const DailyCategoryPage({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomDefaultAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hi!',
                  style: TextStyle(fontSize: 57),
                ),
                Text('Today\'s category is $category.',
                    style: const TextStyle(fontSize: 35, color: Colors.grey)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 40, bottom: 30),
              child: Stack(alignment: Alignment.center, children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: const AspectRatio(
                    aspectRatio: 1,
                    child: Image(
                        image: AssetImage('assets/images/coffee1.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/take-picture');
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromRadius(60),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.white.withOpacity(0.7)),
                  child: const Icon(
                    Icons.add,
                    size: 60,
                    color: Colors.deepPurple,
                  ),
                ),
              ]),
            ),
            const Text('Add yours today\'s photo! :)',
                style: TextStyle(
                  color: Colors.grey,
                )),
          ],
        ),
      ),
    );
  }
}
