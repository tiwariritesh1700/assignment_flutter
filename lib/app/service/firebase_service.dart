import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseService{



  static FirebaseAuth auth = FirebaseAuth.instance;

  final googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  googleLogin() async{
    try {
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null) return;


      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
              accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await auth.signInWithCredential(credential);
    } catch (e) {
      print(e);
    }
  }

  signOut() async{
    try {
      await auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}