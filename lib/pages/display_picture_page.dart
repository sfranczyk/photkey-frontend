import 'dart:io';

import 'package:flutter/material.dart';

class DisplayPicturePage extends StatelessWidget {
  final String imagePath;

  const DisplayPicturePage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    var imgFile = File(imagePath);

    return Scaffold(
      appBar: AppBar(
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text(
                'Coffee',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(width: 0.0),
            ]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(image: FileImage(imgFile), fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(height: 70)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 8,
        onPressed: () {
          Navigator.popAndPushNamed(context, '/photo-rating');
        },
        icon: const Icon(Icons.send),
        label: const Text('Send',
            style: TextStyle(fontSize: 20)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
