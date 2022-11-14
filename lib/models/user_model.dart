import 'dart:convert';

import 'package:photkey/models/photo.dart';

class UserModel {
  String? token;
  final String username;
  final String email;
  final String description;
  final String avatarImage;
  final String friendsTotal;
  final String photosTotal;
  final String likesTotal;
  final List<Photo> photos;

  UserModel( {
    required this.username,
    required this.email,
    required this.description,
    required this.avatarImage,
    required this.friendsTotal,
    required this.photosTotal,
    required this.likesTotal,
    required this.photos,
    this.token
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        token: json['token'] ?? "",
        username: json['username'] ?? "",
        email: json['email'] ?? "",
        description: json['description'] ?? "",
        avatarImage: json['avatarImage'] ?? "",
        friendsTotal: json['friendsTotal'] ?? "",
        photosTotal: json['photosTotal'] ?? "",
        likesTotal: json['likesTotal'] ?? "",
        photos: json['photos'] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {
      "token": token,
      "username": username,
      "email": email,
      "description": description,
      "avatarImage": avatarImage,
      "friendsTotal": friendsTotal,
      "photosTotal": photosTotal,
      "likesTotal": likesTotal,
      "photos": photos
    };
  }

  static List<UserModel> userModelFromJson(String str) =>
      List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

  static String userModelToJson(List<UserModel> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}
