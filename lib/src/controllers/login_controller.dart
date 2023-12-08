import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:greenglimpse/src/models/user_model.dart';

class LoginController extends ChangeNotifier {
  late UserModel _user;

  LoginController() {
    _user = UserModel(email: '', password: '');
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel get user => _user;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print("Error signing in: $e");
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Get the current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

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
