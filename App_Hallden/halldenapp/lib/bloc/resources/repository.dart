import 'dart:async';
import 'api.dart';
import 'package:halldenapp/models/classes/user.dart';

class Repository {
  final usersApiProvider = ApiProvider();

  Future<User> registerUser(String username, String firstname, String lastname,
          String password, String emailadress) =>
      usersApiProvider.registerUser(
          username, firstname, lastname, password, emailadress);
}
