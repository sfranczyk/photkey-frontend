import 'dart:io' show Platform;
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:photkey/alerts/login_failed_alert.dart';
import 'package:photkey/alerts/login_success_alert.dart';

import '../../alerts/friend_added_alert.dart';
import '../../utils/user/user_qr_scan_app_bar.dart';
import '../../widget/user/user_qr_overlay_widget.dart';

class UserQrScanPage extends StatefulWidget {
  const UserQrScanPage({Key? key}) : super(key: key);

  @override
  State<UserQrScanPage> createState() => _UserQrScanPageState();
}

class _UserQrScanPageState extends State<UserQrScanPage> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  bool _screenOpened = false;
  MobileScannerController cameraController = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: UserQrScanAppBar(
          cameraController: cameraController,
        ),
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            buildMobileScanner(),
            buildQrFrame(),
            // Positioned(
            //   bottom: 10,
            //   child: buildQrResult(),
            // )
          ],
        ),
      ),
    );
  }

  Widget buildQrFrame() {
    return UserQrScannerOverlayWidget(
      overlayColour: Colors.black.withOpacity(0.5),
    );
  }

  Widget buildMobileScanner() {
    return MobileScanner(
      allowDuplicates: true,
      controller: cameraController,
      onDetect: _onDetect,
    );
  }

  void _onDetect(Barcode barcode, MobileScannerArguments? args) {
    if (!_screenOpened) {
      final String code = barcode.rawValue ?? "Scan a code!";
      debugPrint('Result: $code');
      _screenOpened = true;
      FriendAddedAlert(context, code);
    }
  }

  void _screenWasClosed() {
    _screenOpened = false;
  }
}
