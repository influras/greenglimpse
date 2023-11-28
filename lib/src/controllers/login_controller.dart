import 'package:flutter/material.dart';
import 'package:greenglimpse/src/models/user_model.dart';

class LoginController extends ChangeNotifier {
  late UserModel _user;

  LoginController() {
    _user = UserModel(username: '', password: '');
  }

  UserModel get user => _user;

  void updateUsername(String value) {
    _user.username = value;
    notifyListeners();
  }

  void updatePassword(String value) {
    _user.password = value;
    notifyListeners();
  }

  void loginUser() {
    // Implement your login logic here
    // For simplicity, let's just print the user credentials
    print('Username: ${_user.username}, Password: ${_user.password}');
  }
}