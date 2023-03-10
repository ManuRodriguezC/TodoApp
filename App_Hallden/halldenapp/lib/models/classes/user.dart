import 'package:flutter/rendering.dart';

class User {
  String? username;
  String? lastname;
  String? firstname;
  String? email;
  String? password;
  String? api_key;
  String? id;

  User(this.username, this.lastname, this.firstname, this.email, this.password,
      this.api_key, String? id);

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
      parsedJson["username"],
      parsedJson["lastname"],
      parsedJson["emailadress"],
      parsedJson["firstname"],
      parsedJson["password"],
      parsedJson["id"],
      parsedJson["api_key"],
    );
  }
}
