import 'package:flutter/material.dart';
import 'package:photkey/pages/user/user_profile_page.dart';
import 'package:photkey/utils/custom_default_app_bar.dart';
import 'package:photkey/utils/user/user_preferences.dart';
import 'package:photkey/widget/user/user_profile_avatar_widget.dart';
import 'package:provider/provider.dart';

import '../../api/api_service.dart';
import '../../models/user_model.dart';

class UserFriendsPage extends StatefulWidget {
  UserFriendsPage({Key? key}) : super(key: key);

  @override
  State<UserFriendsPage> createState() => _UserFriendsPageState();
}

class _UserFriendsPageState extends State<UserFriendsPage> {
  late UserModel userModel;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    // userModel = (await ApiService().login("bob", "bob123"))!;
    userModel = UserPreferences.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomDefaultAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Your Friends (${userModel.friendsTotal})',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 24,
              ),
              buildGridViewFriendList(),
            ],
          ),
        ));
  }

  Widget buildGridViewFriendList() {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1.5,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      primary: false,
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
      shrinkWrap: true,
      children: [
        buildFriendItem(
            user: UserModel(username: 'john2132', email: 'john@gmail.com', description: 'hello my name is john',
                avatarImage: 'assets/images/coffee1.jpg', photosTotal: '12', friendsTotal: '32', likesTotal: '44', photos: [])),
        buildFriendItem(
            user: UserModel(username: 'cris2131', email: 'kris@gmail.com', description: 'hello my name is kris',
                avatarImage: 'assets/images/coffee2.png', photosTotal: '65', friendsTotal: '88', likesTotal: '99', photos: [])),
        buildFriendItem(
            user: UserModel(username: 'bobblabla', email: 'bobblabla@gmail.com', description: 'i like trains',
                avatarImage: 'assets/images/coffee3.jpg', photosTotal: '62', friendsTotal: '27', likesTotal: '84', photos: [])),
        buildFriendItem(
            user: UserModel(username: 'Margaret12', email: 'Margaret12@gmail.com', description: 'I liek photos ',
                avatarImage: 'assets/images/coffee4.jpg', photosTotal: '35', friendsTotal: '78', likesTotal: '73', photos: [])),
      ],
    );
  }

  Widget buildFriendItem({
    required UserModel user,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      elevation: 4,
      shadowColor: Colors.grey.shade100,
      color: Colors.grey.shade50,
      child: Container(
        padding: const EdgeInsets.only(top: 13),
        child: Column(
          children: [
            Stack(
              children: [
                UserProfileAvatarWidget(
                    avatar: user.avatarImage,
                    onClicked: () async {  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          UserProfilePage(userModel: userModel, isOwner: false,)
                        )); },
                    width: 60,
                    height: 60,
                    isEditable: false),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 2),
              child: Text(
                user.username,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
