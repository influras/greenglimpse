import 'package:greenglimpse/src/models/user_model.dart';

class CustomerModel extends UserModel {
  late final String _firstName;
  late final String _lastName;

  get firstName => _firstName;
  set firstName(value) => _firstName = value;
  get lastName => _lastName;
  set lastName(value) => _lastName = value;

  CustomerModel({
    required firstName,
    required lastName,
    required super.email,
    required super.password,
  })  : _firstName = firstName,
        _lastName = lastName;

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
