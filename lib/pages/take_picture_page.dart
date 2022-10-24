import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_editor/image_editor.dart';

import 'display_picture_page.dart';

class TakePicturePage extends StatefulWidget {
  const TakePicturePage({
    super.key,
    required this.cameras,
  });

  final List<CameraDescription> cameras;

  @override
  TakePicturePageState createState() => TakePicturePageState();
}

class TakePicturePageState extends State<TakePicturePage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  var _selectedCameraIndex = 0;

  void _nextCamera() {
    var cameras = widget.cameras;

    if (cameras.length == 1) {
      return;
    }

    _selectedCameraIndex = (cameras.length - 1 > _selectedCameraIndex) ? _selectedCameraIndex + 1 : 0;

    _controller.dispose().then((_) {
      setState(() {
        _controller = CameraController(
          widget.cameras[_selectedCameraIndex],
          ResolutionPreset.high,
        );
        _initializeControllerFuture = _controller.initialize();
      });
    });
  }

  Future<void> _flipPhoto(String path) async {
    // bug - when taking a photo using the front camera it is mirrored initially (horizontally)
    // solution - flip the image on its X axis
    if (widget.cameras[_selectedCameraIndex].lensDirection == CameraLensDirection.front) {
      // 1. read the image from disk into memory
      var file = File(path);
      Uint8List imageBytes = await file.readAsBytes();

      // 2. flip the image on the X axis
      final ImageEditorOption option = ImageEditorOption();
      option.addOption(FlipOption(horizontal: true));
      imageBytes = (await ImageEditor.editImage(image: imageBytes, imageEditorOption: option))!;

      // 3. write the image back to disk
      await file.delete();
      await file.writeAsBytes(imageBytes);
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.cameras.first,
      ResolutionPreset.high,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(children: <Widget>[
              Center(
                child: CameraPreview(_controller),
              ),
            ]);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            IconButton(
                icon: const Icon(Icons.cameraswitch_outlined),
                onPressed: () {
                  _nextCamera();
                }),
            const Spacer(),
            IconButton(
                icon: const Icon(Icons.image_outlined), onPressed: () {}),
          ],
        ),
      )),
      floatingActionButton: SizedBox(
        width: 72,
        height: 72,
        child: FittedBox(
          child: FloatingActionButton(
            elevation: 8,
            onPressed: () async {
              try {
                await _initializeControllerFuture;
                final image = await _controller.takePicture();

                await _flipPhoto(image.path);

                if (!mounted) return;
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DisplayPicturePage(
                      imagePath: image.path,
                    ),
                  ),
                );
              } catch (e) {
                print(e);
              }
            },
            child: const Icon(Icons.camera_alt),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
