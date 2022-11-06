import 'package:flutter/material.dart';
import 'package:photkey/utils/user/user_avatar_app_bar.dart';

class CustomDefaultAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomDefaultAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Align(
        alignment: Alignment.centerRight,
        child: UserAvatarAppBar()
      ),
    );
  }
}
