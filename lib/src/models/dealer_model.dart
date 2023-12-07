import 'dart:convert';

import 'package:greenglimpse/src/models/user_model.dart';

class DealerModel extends UserModel {
  late String _companyName;
  late String _contactFirstName;
  late String _contactLastName;
  late String _contactPhoneNumber;
  late String _phoneNumber;
  late String _country;
  late String _postcode;
  late String _street;

  DealerModel({
    required String companyName,
    required String contactFirstName,
    required String contactLastName,
    required String contactPhoneNumber,
    required String phoneNumber,
    required String country,
    required String postcode,
    required String street,
    required String email,
    required String password,
  })  : _companyName = companyName,
        _contactFirstName = contactFirstName,
        _contactLastName = contactLastName,
        _contactPhoneNumber = contactPhoneNumber,
        _phoneNumber = phoneNumber,
        _country = country,
        _postcode = postcode,
        _street = street,
        super(email: email, password: password);

  DealerModel copyWith({
    String? companyName,
    String? contactFirstName,
    String? contactLastName,
    String? contactPhoneNumber,
    String? phoneNumber,
    String? country,
    String? postcode,
    String? street,
  }) {
    return DealerModel(
      companyName: companyName ?? _companyName,
      contactFirstName: contactFirstName ?? _contactFirstName,
      contactLastName: contactLastName ?? _contactLastName,
      contactPhoneNumber: contactPhoneNumber ?? _contactPhoneNumber,
      phoneNumber: phoneNumber ?? _phoneNumber,
      country: country ?? _country,
      postcode: postcode ?? _postcode,
      street: street ?? _street,
      email: email,
      password: password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'companyName': _companyName,
      'contactFirstName': _contactFirstName,
      'contactLastName': _contactLastName,
      'contactPhoneNumber': _contactPhoneNumber,
      'phoneNumber': _phoneNumber,
      'country': _country,
      'postcode': _postcode,
      'street': _street,
    };
  }

  factory DealerModel.fromMap(Map<String, dynamic> map) {
    return DealerModel(
      companyName: map['companyName'],
      contactFirstName: map['contactFirstName'],
      contactLastName: map['contactLastName'],
      contactPhoneNumber: map['contactPhoneNumber'],
      phoneNumber: map['phoneNumber'],
      country: map['country'],
      postcode: map['postcode'],
      street: map['street'],
      email: map['email'], // assuming these fields exist in the map
      password: map['password'], // assuming these fields exist in the map
    );
  }

  String toJson() => json.encode(toMap());

  factory DealerModel.fromJson(String source) =>
      DealerModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DealerModel(_companyName: $_companyName, _contactFirstName: $_contactFirstName, _contactLastName: $_contactLastName, _contactPhoneNumber: $_contactPhoneNumber, _phoneNumber: $_phoneNumber, _country: $_country, _postcode: $_postcode, _street: $_street)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DealerModel &&
        other._companyName == _companyName &&
        other._contactFirstName == _contactFirstName &&
        other._contactLastName == _contactLastName &&
        other._contactPhoneNumber == _contactPhoneNumber &&
        other._phoneNumber == _phoneNumber &&
        other._country == _country &&
        other._postcode == _postcode &&
        other._street == _street;
  }

  @override
  int get hashCode {
    return _companyName.hashCode ^
        _contactFirstName.hashCode ^
        _contactLastName.hashCode ^
        _contactPhoneNumber.hashCode ^
        _phoneNumber.hashCode ^
        _country.hashCode ^
        _postcode.hashCode ^
        _street.hashCode;
  }
}
