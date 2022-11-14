import 'package:flutter/material.dart';

import '../../models/photo.dart';
import '../../models/user_model.dart';
import '../../utils/header_text.dart';

class UserProfilePhotosWidget extends StatelessWidget {
  UserProfilePhotosWidget({Key? key, required this.user}) : super(key: key);
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
          child: Row(
            children: [
              const HeaderText('User ', Colors.grey),
              HeaderText('Top', Theme.of(context).primaryColorLight),
            ],
          ),
        ),
        GridView.count(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 1,
          childAspectRatio: 1.5,
          mainAxisSpacing: 8,
          children: user.photos.asMap().entries.map((entry) {
            int idx = entry.key;
            Photo photo = entry.value;

            return buildPhotoItem(photo, idx);
          }).toList(),
          ),
      ],
    );
  }

  Widget buildPhotoItem(Photo photo, int index) {
    var isPictureRight = index % 2 == 0;

    double leftMargin = isPictureRight ? 8 : 16;
    double rightMargin = isPictureRight ? 16 : 8;

    List<Widget> elements = [
      Expanded(
        child: Padding(
          padding:
          const EdgeInsets.only(top: 8.0, left: 16, right: 16, bottom: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${index + 1}. ${photo.category}',
                  style: const TextStyle(fontSize: 28)),
              Text('by ${photo.author}',
                  style: TextStyle(fontSize: 18, color: Colors.grey[700])),
              Text(photo.location,
                  style: const TextStyle(fontSize: 18, color: Colors.grey)),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Text(photo.info,
                    style: const TextStyle(fontSize: 18, color: Colors.grey)),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: isPictureRight
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.favorite,
                    size: 16,
                    color: Colors.red,
                  ),
                  Text(' ${photo.likes}'),
                ],
              ),
            ],
          ),
        ),
      ),
      Expanded(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                    left: leftMargin, right: rightMargin, top: 8, bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 0,
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                      image: AssetImage(photo.urlImage), fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
      ),
    ];

    return Row(
      children: isPictureRight ? elements : elements.reversed.toList(),
    );
  }

}
