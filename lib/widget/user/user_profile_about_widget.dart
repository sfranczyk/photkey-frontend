import 'package:flutter/material.dart';

import '../../providers/header_text.dart';

class UserProfileAboutWidget extends StatelessWidget {
  const UserProfileAboutWidget({Key? key, required this.description})
      : super(key: key);
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
          child: Row(
            children: [
              const HeaderText('About ', Colors.grey),
              HeaderText('Me', Theme.of(context).primaryColorLight),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              Text(
                description,
                style: const TextStyle(fontSize: 16, height: 1.4),
              )
            ],
          ),
        ),
      ],
    );
  }
}
