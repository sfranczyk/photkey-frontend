import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class UserQrScanAppBar extends StatelessWidget implements PreferredSizeWidget {
  UserQrScanAppBar({Key? key, required this.cameraController})
      : super(key: key);

  MobileScannerController cameraController;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'QR Scanner',
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary),
      ),
      actions: [
        IconButton(
          onPressed: () {
            cameraController.toggleTorch();
          },
          icon: ValueListenableBuilder(
            valueListenable: cameraController.torchState,
            builder: (BuildContext context, value, Widget? child) {
              switch (value) {
                case TorchState.off:
                  return const Icon(
                    Icons.flash_off,
                    color: Colors.grey,
                  );
                case TorchState.on:
                  return const Icon(
                    Icons.flash_on,
                    color: Colors.yellow,
                  );
              }
            },
          ),
          iconSize: 32,
          color: Colors.white,
        ),
        const SizedBox(
          width: 10,
        ),
        IconButton(
          color: Colors.black,
          icon: ValueListenableBuilder(
            valueListenable: cameraController.cameraFacingState,
            builder: (context, value, child) {
              switch (value) {
                case CameraFacing.front:
                  return const Icon(Icons.camera_front);
                case CameraFacing.back:
                  return const Icon(Icons.camera_rear);
              }
            },
          ),
          iconSize: 32.0,
          onPressed: () => cameraController.switchCamera(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
