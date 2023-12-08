import 'package:firebase_auth/firebase_auth.dart';
import 'package:greenglimpse/src/models/customer_model.dart';
import 'package:greenglimpse/src/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUpWithEmailAndPassword(CustomerModel customer) async {
    try {
      // Create a new user with email and password
      await _auth.createUserWithEmailAndPassword(
        email: customer.email,
        password: customer.password,
      );

      // After creating the user, save additional user information to Firestore
      await FirebaseFirestore.instance.collection('users').doc(customer.email).set({
        'firstName': customer.firstName,
        'lastName': customer.lastName,
        'country': customer.country,
        'city': customer.city,
        'postcode': customer.postcode,
        'street': customer.street,
      });
    } catch (e) {
      print("Error signing up: $e");
    }
  }

  Future<void> signInWithEmailAndPassword(UserModel user) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
    } catch (e) {
      print("Error signing in: $e");
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
