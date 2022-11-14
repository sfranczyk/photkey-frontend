import 'package:flutter/material.dart';
import 'package:photkey/utils/user/user_preferences.dart';
import 'package:photkey/widget/user/user_profile_about_widget.dart';
import 'package:photkey/widget/user/user_profile_buttons_widget.dart';
import 'package:photkey/widget/user/user_profile_photos_widget.dart';
import 'package:provider/provider.dart';

import '../../api/api_service.dart';
import '../../models/user_model.dart';
import '../../utils/custom_default_app_bar.dart';
import '../../widget/user/user_profile_avatar_widget.dart';
import '../../widget/user/user_profile_stats_widget.dart';

class UserProfilePage extends StatefulWidget {
  UserProfilePage({Key? key, required this.isOwner, this.userModel})
      : super(key: key);
  late UserModel? userModel;
  final bool isOwner;

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    if(widget.isOwner){
      // widget.userModel = (await ApiService().login("bob", "bob123"))!;
      widget.userModel = UserPreferences.user;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: const CustomDefaultAppBar(),
        body: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            UserProfileAvatarWidget(
              avatar: widget.userModel!.avatarImage,
              onClicked: () async {},
              width: 180,
              height: 180,
              isEditable: widget.isOwner,
            ),
            const SizedBox(
              height: 20,
            ),
            buildName(widget.userModel!),
            const SizedBox(
              height: 20,
            ),
            UserProfileStatsWidget(
              user: widget.userModel!,
              isOwner: widget.isOwner,
            ),
            const SizedBox(
              height: 20,
            ),
            UserProfileButtonsWidget(
              isOwner: widget.isOwner,
            ),
            UserProfileAboutWidget(description: widget.userModel!.description),
            const SizedBox(
              height: 20,
            ),
            UserProfilePhotosWidget(user: widget.userModel!),
          ],
        ));
  }

  Widget buildName(UserModel userModel) => Column(
        children: [
          Text(
            userModel.username,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            userModel.email,
            style: const TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildDescription(UserModel userModel) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            userModel.description,
            style: const TextStyle(fontSize: 16, height: 1.4),
          )
        ],
      ),
    );
  }
}
