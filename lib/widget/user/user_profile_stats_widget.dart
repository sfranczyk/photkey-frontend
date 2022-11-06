import 'package:flutter/material.dart';

import '../../models/user_model.dart';

class UserProfileStatsWidget extends StatelessWidget {
  const UserProfileStatsWidget({Key? key, required this.user, required this.isOwner})
      : super(key: key);
  final UserModel user;
  final bool isOwner;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(context, user.friendsTotal, 'Friends', () {
            if (isOwner) {
              Navigator.pushNamed(context, '/user-friends');
            }
          }),
          const SizedBox(
            width: 12,
          ),
          buildButton(context, user.photosTotal, 'Photos', () {}),
          const SizedBox(
            width: 12,
          ),
          buildButton(context, user.likesTotal, 'Liked', () {}),
        ],
      ),
    );
  }

  Widget buildButton(
      BuildContext context, String value, String text, VoidCallback onClicked) {
    return MaterialButton(
      onPressed: onClicked,
      color: Colors.grey.shade50,
      elevation: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(value,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          const SizedBox(
            height: 2,
          ),
          Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
