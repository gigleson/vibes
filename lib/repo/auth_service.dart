// auth_repository.dart
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository  {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (error) {
      print('Error signing in: $error');
      return false;
    }
  }

  Future<bool> createUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (error) {
      print('Error creating user: $error');
      return false;
    }
  }
}
