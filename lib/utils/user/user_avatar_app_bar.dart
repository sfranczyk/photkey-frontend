import 'package:flutter/material.dart';

class UserAvatarAppBar extends StatelessWidget {
  const UserAvatarAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/user-profile');
          },
        icon: const CircleAvatar(
          backgroundImage: AssetImage('assets/images/coffee1.jpg'),
        ),
    );
  }
}
