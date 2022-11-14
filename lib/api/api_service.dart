import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../models/user_model.dart';
import 'api_constants.dart';

class ApiService {
  Future<UserModel?> login(String username, String password) async {
    try {
      final uri = Uri.parse(ApiConstants.baseUrl + ApiConstants.loginEndpoint);
      log(uri.toString());
      final headers = {
        'Content-Type': 'application/json',
        'accept': '*/*',
      };
      final jsonBody = json.encode({
        'username' : username,
        'password' : password
      });
      // const jsonBody = '{"username":"bob","password":"bob123"}';
      var response = await http.post(
        uri,
        headers: headers,
        body: jsonBody
      );
      if (response.statusCode == 200) {
        UserModel userModel = UserModel.fromJson(json.decode(response.body));
        return userModel;
      } else if(response.statusCode == 403){
        // LoginFailedAlert(context); // WARN: don't use context in "async" block
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  // Future<List<UserModel>> getUser() async {
  //   try {
  //     var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.getLoggedUserEndpoint);
  //     var response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       List<UserModel> model = UserModel.userModelFromJson(response.body);
  //       return model;
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
}
