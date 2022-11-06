import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class LoginFailedAlert {
  final BuildContext context;

  LoginFailedAlert(this.context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.scale,
      title: 'Login failed!',
      desc: 'Failed to authenticate!',
      autoHide: const Duration(seconds: 3),
      onDismissCallback: (type) {
        debugPrint('Dialog Dissmiss from callback $type');
        Navigator.pop(context);
      },
    ).show();
  }
}
