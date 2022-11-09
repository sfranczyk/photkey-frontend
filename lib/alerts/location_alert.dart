import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class LocationAlert{
  final BuildContext context;
  final String location;

  LocationAlert(this.context, this.location){
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.scale,
      title: 'Congrats!',
      desc: 'You are now friends!\n$location',
      autoHide: const Duration(seconds: 4),
      onDismissCallback: (type) {
        debugPrint('Dialog Dissmiss from callback $type');
        // Navigator.pop(context);
      },
    ).show();
  }
}