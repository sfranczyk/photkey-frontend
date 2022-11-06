import 'package:flutter/material.dart';

class UserProfileAvatarWidget extends StatelessWidget {
  const UserProfileAvatarWidget(
      {super.key,
      required this.avatar,
      required this.onClicked,
      required this.width,
      required this.height,
      required this.isEditable});

  final String avatar;
  final VoidCallback onClicked;
  final double width;
  final double height;
  final bool isEditable;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Center(
      child: Stack(
        children: [
          buildImage(avatar: avatar, width: width, height: height),
          Positioned(bottom: 0, right: 4, child: buildEditIcon(color))
        ],
      ),
    );
  }

  Widget buildImage(
      {required String avatar, required double width, required double height}) {
    final image = AssetImage(avatar);
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: width,
          height: height,
          child: InkWell(
            onTap: onClicked,
          ),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) {
    if (isEditable) {
      return buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: const Icon(
            Icons.edit,
            color: Colors.white,
            size: 20,
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
