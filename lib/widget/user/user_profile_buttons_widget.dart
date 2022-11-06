import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../../alerts/friend_added_alert.dart';
import '../button_widget.dart';

class UserProfileButtonsWidget extends StatelessWidget {
  const UserProfileButtonsWidget({Key? key, required this.isOwner}) : super(key: key);
  final bool isOwner;

  @override
  Widget build(BuildContext context) {
    if(isOwner){
      return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildShowQrButton(context),
                const SizedBox(
                  width: 12,
                ),
                buildScanQrButton(context),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
          ]
      );
    }else{
      return Container();
    }
  }

  Widget buildShowQrButton(BuildContext context) => ButtonWidget(
    text: 'QR Show',
    icon: const Icon(size: 32, Icons.qr_code,),
    onClicked: () {
      Navigator.pushNamed(context, '/user-qr-show');
    },
  );

  Widget buildScanQrButton(BuildContext context) => ButtonWidget(
    text: 'QR Scan',
    icon: const Icon(size: 32, Icons.qr_code_scanner,),
    onClicked: () {
      Navigator.pushNamed(context, '/user-qr-scan');
    },
  );


}
