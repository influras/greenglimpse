// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:greenglimpse/src/models/customer_model.dart';

class RegisterController extends ChangeNotifier {
// Set a threshold screen width for adjusting padding
  final double _thresholdWidth = 1200;
  late CustomerModel _customer;

  String _repeatPassword = '';

  String _selectedCountry = '';

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

  void updateSelectedCountry(String country) {
    _selectedCountry = country;
    notifyListeners();
  }

  String get selectedCountry => _selectedCountry;
}
