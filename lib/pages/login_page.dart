import 'package:flutter/material.dart';
import 'package:photkey/alerts/login_failed_alert.dart';
import 'package:photkey/alerts/login_success_alert.dart';
import 'package:photkey/api/api_service.dart';
import 'package:photkey/models/user_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: <Widget>[
            const Center(
              child: SizedBox(
                  width: 200,
                  height: 150,
                  child: Center(
                    child: Text(
                      'PhotKey',
                      style: TextStyle(fontSize: 40),
                    ),
                  )),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Enter valid email'),
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 10),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                )),
            TextButton(
              onPressed: () {
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: const Text(
                'Forgot Password',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                height: 50,
                width: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/daily-category');
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  setState(Null Function() param0) {}
}
