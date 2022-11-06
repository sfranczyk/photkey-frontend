import 'package:photkey/models/user_model.dart';

import '../../api/api_service.dart';
import '../../models/photo.dart';

class UserPreferences {

      static final user = UserModel(
      username: 'Bob',
      email: 'bob@gmail.com',
      description: 'Where Did it Come From? Some of the earliest expressions of street art were certainly the graffiti which started showing up on the sides of train cars and walls. This was the work of gangs in the 1920s and 1930s New York. The impact of this subversive culture was extraordinarily felt in the 1970s and 1980s.Jul 29, 2014 Where Did it Come From? Some of the earliest expressions of street art were certainly the graffit',
      avatarImage: 'assets/images/coffee1.jpg',
      friendsTotal: '23',
      photosTotal: '42',
      likesTotal: '54',
      photos: [
        Photo(author: 'Susann', category: 'Snickers', location: 'Aveiro', likes: 123, info: 'Big noon coffee.', urlImage: 'assets/images/coffee3.jpg'),
        Photo(author: 'Adam', category: 'Coffee', location: 'Wrocław', likes: 2138, info: 'Small morning coffee.', urlImage: 'assets/images/coffee1.jpg'),
        Photo(author: 'Susann', category: 'Snickers', location: 'Aveiro', likes: 123, info: 'Big noon coffee.', urlImage: 'assets/images/coffee3.jpg'),
        Photo(author: 'Adam', category: 'Coffee', location: 'Wrocław', likes: 2138, info: 'Small morning coffee.', urlImage: 'assets/images/coffee1.jpg'),
        Photo(author: 'Susann', category: 'Snickers', location: 'Aveiro', likes: 123, info: 'Big noon coffee.', urlImage: 'assets/images/coffee3.jpg'),
        Photo(author: 'Susann', category: 'Snickers', location: 'Aveiro', likes: 123, info: 'Big noon coffee.', urlImage: 'assets/images/coffee3.jpg'),
        Photo(author: 'Adam', category: 'Coffee', location: 'Wrocław', likes: 2138, info: 'Small morning coffee.', urlImage: 'assets/images/coffee1.jpg'),
        Photo(author: 'Susann', category: 'Snickers', location: 'Aveiro', likes: 123, info: 'Big noon coffee.', urlImage: 'assets/images/coffee3.jpg'),
        Photo(author: 'Adam', category: 'Coffee', location: 'Wrocław', likes: 2138, info: 'Small morning coffee.', urlImage: 'assets/images/coffee1.jpg'),
        Photo(author: 'Susann', category: 'Snickers', location: 'Aveiro', likes: 123, info: 'Big noon coffee.', urlImage: 'assets/images/coffee2.png'),
      ]);
}
