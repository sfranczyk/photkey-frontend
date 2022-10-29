import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:photkey/pages/daily_category_page.dart';
import 'package:photkey/pages/daily_top_page.dart';
import 'package:photkey/pages/login_page.dart';
import 'package:photkey/pages/photo_rating/photo_rating_page.dart';
import 'package:photkey/pages/select_favourite_page.dart';
import 'package:photkey/pages/take_picture_page.dart';
import 'package:provider/provider.dart';

import 'providers/card_provider.dart';

Future<void> main() async {
  const String title = 'PhotKey';

  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();

  final ThemeData themeData = ThemeData(
    primarySwatch: Colors.deepPurple,
    fontFamily: 'Roboto',
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
  );

  final routes = {
    '/': (context) => const LoginPage(),
    '/daily-category': (context) => const DailyCategoryPage(category: 'coffee'),
    '/photo-rating': (context) => const PhotoRatingPage(),
    '/daily-top': (context) => const DailyTopPage(),
    '/select-favourite': (context) => const SelectFavouritePage(),
    '/take-picture': (context) => TakePicturePage(cameras: cameras),
  };

  runApp(ChangeNotifierProvider(
      create: (context) => CardProvider(),
      child: MaterialApp(
        title: title,
        theme: themeData,
        routes: routes,
        initialRoute: '/',
      )));
}
