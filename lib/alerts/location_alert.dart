import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class LocationAlert{
  final BuildContext context;
  final String location;

  LocationAlert(this.context, this.location){
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.scale,
      title: 'Photo added!',
      desc: 'Position: \n$location',
      autoHide: const Duration(seconds: 2),
      onDismissCallback: (type) {
        debugPrint('Dialog Dissmiss from callback $type');
        Navigator.pop(context);
        Navigator.pushNamed(context, '/photo-rating');
      },
    ).show();
  }
}