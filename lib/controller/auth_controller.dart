
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isLoading = false;
  String? error;

  User? get user => _auth.currentUser;

  Future<void> register(String email, String password) async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      error = e.message;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> login(String email, String password) async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      error = e.message;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      error = null;
      isLoading = true;
      notifyListeners();

      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

    } on FirebaseAuthException catch (e) {
      error = e.message ?? "Failed to send reset email";
    } catch (e) {
      error = "Something went wrong. Please try again.";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }


  Future<void> logout() async {
    await _auth.signOut();
  }
}