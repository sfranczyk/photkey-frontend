import 'package:photkey/models/photo.dart';

class User {
  final String username;
  final String email;
  final String description;
  final String avatarImage;
  final String friendsTotal;
  final String photosTotal;
  final String likesTotal;
  final List<Photo> photos;

  User(
      {required this.username,
      required this.email,
      required this.description,
      required this.avatarImage,
      required this.friendsTotal,
      required this.photosTotal,
      required this.likesTotal,
      required this.photos});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        username: json['username'] ?? "",
        email: json['email'] ?? "",
        description: json['description'] ?? "",
        avatarImage: json['avatarImage'] ?? "",
        friendsTotal: json['friendsTotal'] ?? "",
        photosTotal: json['photosTotal'] ?? "",
        likesTotal: json['likesTotal'] ?? "",
        photos: json['photos'] ?? "");
  }

  // Map<String, dynamic> toJson (){
  //   return {
  //     "username": username,
  //     "email": email,
  //     "description": description,
  //     "avatarImage": avatarImage,
  //   };
  // }
}
