import 'package:flutter/material.dart';
import 'package:greenglimpse/src/models/user_model.dart';

class LoginController extends ChangeNotifier {
  late UserModel _user;

  LoginController() {
    _user = UserModel(email: '', password: '');
  }

  UserModel get user => _user;

  void updateUsername(String value) {
    _user.email = value;
    notifyListeners();
  }

  void updatePassword(String value) {
    _user.password = value;
    notifyListeners();
  }

  void loginUser() {
    // Implement your login logic here
    // For simplicity, let's just print the user credentials
    // ignore: avoid_print
    print('Username: ${_user.email}, Password: ${_user.password}');
  }

  void updateAcceptTerms(bool bool) {}
}