import 'package:flutter/material.dart';
import 'package:photkey/models/photo.dart';
import 'package:photkey/providers/card_provider.dart';
import 'package:photkey/utils/photo_card.dart';
import 'package:photkey/utils/user/user_avatar_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:shake/shake.dart';

import 'button_under_rating_image.dart';

class PhotoRatingPage extends StatefulWidget {
  const PhotoRatingPage({Key? key}) : super(key: key);

  @override
  State<PhotoRatingPage> createState() => _PhotoRatingPageState();
}

class _PhotoRatingPageState extends State<PhotoRatingPage> {
  late List<Photo> images;
  late ShakeDetector detector;
  var _isShake = 0;

  @override
  void initState() {
    super.initState();
    detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        _isShake++;
        setState(() {});
        var img = images.last;
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            _isShake--;
            if (_isShake == 0) {
              img.isStarred = true;
            }
          });
        });
      },
      minimumShakeCount: 1,
      shakeSlopTimeMS: 100,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 2.7,
    );
  }

  @override
  void dispose() {
    super.dispose();
    detector.stopListening();
  }

  @override
  Widget build(BuildContext context) {
    images = Provider.of<CardProvider>(context).images;
    var isMoreThan2 = images.length > 1;
    return Scaffold(
        appBar: AppBar(
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SizedBox(width: 0.0),
                Text(
                  'Rate by swiping',
                  style: TextStyle(color: Colors.black),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: UserAvatarAppBar()
                )
              ]),
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.thumb_down,
                      color: Colors.orangeAccent[100],
                      size: 30,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.thumb_up,
                      color: Colors.purple[100],
                      size: 30,
                    )),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: images
                  .map((e) => PhotoCard(
                        urlPhoto: e.urlImage,
                        isFront: images.last == e,
                        isSecond:
                            isMoreThan2 ? images[images.length - 2] == e : true,
                        isShake: _isShake > 0,
                        isStared: images.last == e && e.isStarred,
                      ))
                  .toList(),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonUnderRatingImage(
                    hint: 'Previous', icon: Icons.arrow_back, onPressed: () {}),
                images.last.isStarred
                    ? ButtonUnderRatingImage(
                        hint: 'Unstar',
                        icon: Icons.star_half_sharp,
                        color: Colors.red,
                        onPressed: () {
                          setState(() {
                            images.last.isStarred = false;
                          });
                        })
                    : const Spacer(),
                ButtonUnderRatingImage(
                    hint: 'Liked',
                    icon: Icons.grid_on,
                    onPressed: () {
                      Navigator.pushNamed(context, '/select-favourite');
                    }),
              ],
            ),
          ),
        ]));
  }
}
