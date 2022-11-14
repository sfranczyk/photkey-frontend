import 'package:flutter/material.dart';
import 'package:photkey/utils/custom_default_app_bar.dart';
import 'package:qr_flutter/qr_flutter.dart';

class UserQrShowPage extends StatefulWidget {
  const UserQrShowPage({Key? key}) : super(key: key);

  @override
  State<UserQrShowPage> createState() => _UserQrShowPageState();
}

class _UserQrShowPageState extends State<UserQrShowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomDefaultAppBar(),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Your QR:',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Stack(alignment: Alignment.center, children: <Widget> [
                QrImage(
                  data: "get Data",
                  size: 400,
                  backgroundColor: Colors.white,
                  foregroundColor: Theme.of(context).colorScheme.primary,
                ),

              ]),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
