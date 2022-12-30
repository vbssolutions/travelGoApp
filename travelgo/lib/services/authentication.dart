import 'package:firebase_auth/firebase_auth.dart';

import 'package:travelgo/services/db.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get user => _auth.authStateChanges();

// Connexion de l'utilisateur

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());

      final User? user = await authResult.user;

      return user;
    } on FirebaseAuthException catch (error) {
      return error.message;
    }
  }

//Enrollement d'un nouvel utilisateur
  Future signUpWithEmailAndPassword(
    String email,
    String matricule,
    String name,
    String password,
    String phone,
    String surname,
  ) async {
    try {
      //Creation d'un nouvel utilisateur avec une adresse email et un mot de passe
      final UserCredential authResult =
          await _auth.createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim());
      //Recuperation de l'utilisateur couramment connecté
      final User? user = authResult.user;

      //Renvoyer l'utilisateur couramment  connecté en sortie
      return user;
    } on FirebaseAuthException catch (error) {
      //message d'erreur de connexion
      return error.message;
    }
  }

  //Deconnexion de l'utilisateur connecté

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
