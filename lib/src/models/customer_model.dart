import 'package:greenglimpse/src/models/user_model.dart';

class CustomerModel extends UserModel {
  late final String _firstName;
  late final String _lastName;
  late final String _country;
  late final String _city;
  late final String _postcode;
  late final String _street;
  get country => _country;

 set country(value) => _country = value;

  get city => _city;

  set city( value) => _city = value;

  get postcode => _postcode;

  set postcode( value) => _postcode = value;

  get street => _street;

  set street( value) => _street = value;

  get firstName => _firstName;
  set firstName(value) => _firstName = value;
  get lastName => _lastName;
  set lastName(value) => _lastName = value;

  CustomerModel({
    required firstName,
    required lastName,
    required country,
    required city,
    required postcode,
    required street,
    required super.email,
    required super.password,
  })  : _firstName = firstName,
        _lastName = lastName,
        _country = country,
        _city = city,
        _postcode = postcode,
        _street = street;

  @override
  String toString() =>
      'CutomerModel(_firstName: $_firstName, _lastName: $_lastName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CustomerModel &&
        other._firstName == _firstName &&
        other._lastName == _lastName;
  }

  @override
  int get hashCode => _firstName.hashCode ^ _lastName.hashCode;
}
