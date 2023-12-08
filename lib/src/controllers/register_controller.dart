// ignore_for_file: prefer_final_fields

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:greenglimpse/src/models/customer_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterController extends ChangeNotifier {
// Set a threshold screen width for adjusting padding
  final double _thresholdWidth = 1200;
  late CustomerModel _customer;

  String _repeatPassword = '';

  String? _selectedCountry;

  String? get selectedCountry => _selectedCountry;

  bool _acceptTerms = false;

  RegisterController() {
    _customer = CustomerModel(
        firstName: '',
        lastName: '',
        email: '',
        password: '',
        country: '',
        city: '',
        postcode: '',
        street: '');
  }

/*
 * This method returns the padding for the RegisterView body Column
 */
  double returnRegisterViewPadding(BuildContext buildContext) {
    double screenWidth = MediaQuery.of(buildContext).size.width;
    double padding =
        screenWidth < RegisterController()._thresholdWidth ? 32.0 : 400;
    return padding;
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> register() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _customer.email,
        password: _customer.password,
      );

      // Create a CustomerModel instance with the provided details
      CustomerModel customer = CustomerModel(
        firstName: _customer.firstName,
        lastName: _customer.lastName,
        country: _customer.country,
        city: _customer.city,
        postcode: _customer.postcode,
        street: _customer.street,
        email: _customer.email,
        password: _customer.password,
      );

      // Convert the CustomerModel to a map
      Map<String, dynamic> userMap = customer.toJson();

      // Save user details to Firestore
      await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(userMap);

      // ... continue with the rest of your logic ...
    } catch (e) {
      // Handle registration errors
      print(e.toString());
    }
  }

  void updateFirstName(String value) {
    _customer.firstName = value;
    notifyListeners();
  }

  void updateLastName(String value) {
    _customer.lastName = value;
  }

  void updateEmail(String value) {
    _customer.email = value;
    notifyListeners();
  }

  void updatePassword(String value) {
    _customer.password = value;
    notifyListeners();
  }

  bool passwordsMatch() {
    return _customer.password == _repeatPassword;
  }

  void updateRepeatPassword(String value) {
    _repeatPassword = value;
    notifyListeners();
  }

  void updateCountry(String value) {
    _customer.country = value;
    notifyListeners();
  }

  void updateCity(String value) {
    _customer.city = value;
    notifyListeners();
  }

  void updatePostcode(String value) {
    _customer.postcode = value;
    notifyListeners();
  }

  void updateStreet(String value) {
    _customer.street = value;
    notifyListeners();
  }

  void updateAcceptTerms(bool accepted) {
    _acceptTerms = accepted;
    notifyListeners();
  }

  bool get acceptTerms => _acceptTerms;

  void updateSelectedCountry(String value) {
    _selectedCountry = value;
    notifyListeners();
  }
}
