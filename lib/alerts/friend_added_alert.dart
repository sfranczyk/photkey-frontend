import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class FriendAddedAlert{
  final BuildContext context;
  final String qrVal;

  FriendAddedAlert(this.context, this.qrVal){
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.scale,
      title: 'Congrats!',
      desc: 'You are now friends!\n$qrVal',
      autoHide: const Duration(seconds: 4),
      onDismissCallback: (type) {
        debugPrint('Dialog Dissmiss from callback $type');
        Navigator.pop(context);
      },
    ).show();
  }
}