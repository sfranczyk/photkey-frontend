import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:photkey/alerts/location_alert.dart';
import 'package:photkey/providers/location_provider.dart';
import 'package:provider/provider.dart';

class DisplayPicturePage extends StatefulWidget {
  final String imagePath;

  DisplayPicturePage({super.key, required this.imagePath});

  @override
  State<DisplayPicturePage> createState() => _DisplayPicturePageState();
}

class _DisplayPicturePageState extends State<DisplayPicturePage> {
  Future<Position>? _position;

  @override
  initState() {
    super.initState();
    _updateLocation();
  }

  Future<void> _updateLocation() async {
    _position = Provider.of<LocationProvider>(context).getLocation();
  }

  @override
  Widget build(BuildContext context) {
    _updateLocation();

    var imgFile = File(widget.imagePath);
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
            const SizedBox(height: 70),
          ],
        ),
      ),
      floatingActionButton: FutureBuilder(
        future: _position,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return FloatingActionButton.extended(
                elevation: 8,
                onPressed: () {
                  debugPrint(snapshot.data.toString());
                  LocationAlert(context, snapshot.data.toString());
                },
                icon: const Icon(Icons.send),
                label: const Text('Send',
                    style: TextStyle(fontSize: 20)),
              );
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
