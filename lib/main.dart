import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:photkey/pages/daily_category_page.dart';
import 'package:photkey/pages/daily_top_page.dart';
import 'package:photkey/pages/login_page.dart';
import 'package:photkey/pages/photo_rating/photo_rating_page.dart';
import 'package:photkey/pages/user/user_friends_page.dart';
import 'package:photkey/pages/user/user_profile_page.dart';
import 'package:photkey/pages/select_favourite_page.dart';
import 'package:photkey/pages/take_picture_page.dart';
import 'package:photkey/pages/user/user_qr_scan_page.dart';
import 'package:photkey/pages/user/user_qr_show_page.dart';
import 'package:photkey/providers/location_provider.dart';
import 'package:provider/provider.dart';

import 'providers/card_provider.dart';

Future<void> main() async {
  const String title = 'PhotKey';

  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();

  final ThemeData themeData = ThemeData(
    primarySwatch: Colors.deepOrange,
    fontFamily: 'Roboto',
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
  );

  final routes = {
    '/': (context) => LoginPage(),
    '/daily-category': (context) => const DailyCategoryPage(category: 'coffee'),
    '/photo-rating': (context) => const PhotoRatingPage(),
    '/daily-top': (context) => const DailyTopPage(),
    '/select-favourite': (context) => const SelectFavouritePage(),
    '/take-picture': (context) => TakePicturePage(cameras: cameras),
    '/user-profile': (context) => UserProfilePage(isOwner: true),
    '/user-qr-show': (context) => const UserQrShowPage(),
    '/user-qr-scan': (context) => const UserQrScanPage(),
    '/user-friends': (context) => UserFriendsPage(),
  };

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CardProvider()),
      ChangeNotifierProvider(create: (context) => LocationProvider()),
    ],
    child: MaterialApp(
      title: title,
      theme: themeData,
      routes: routes,
      initialRoute: '/take-picture',
    ),
  ));
}
