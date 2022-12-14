import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class LoginSuccessAlert {
  final String? username;
  final BuildContext context;

  LoginSuccessAlert(this.context, this.username) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.scale,
      title: 'Hello $username!',
      desc: 'Authentication success!',
      autoHide: const Duration(seconds: 3),
      onDismissCallback: (type) {
        debugPrint('Dialog Dissmiss from callback $type');
        Navigator.pop(context);
      },
    ).show();
  }
}
