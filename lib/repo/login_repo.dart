import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaselogin/constant/const.dart';
import 'package:flutter/material.dart';

class AuthRepo {
  static Future<bool> loginRepo({String? email, String? pass}) async {
    try {
      await kFirebaseAuth.signInWithEmailAndPassword(
          email: email!, password: pass!);
      return true;
    } catch (e) {
      print("login error ==> $e");
      return false;
    }
  }

  static passwordreset({String? email, BuildContext? context}) async {
    await kFirebaseAuth.sendPasswordResetEmail(email: email!);
  }

  static deleteaccount({
    String? email,
    String? pass,
    BuildContext? context,
  }) async {
    User? user = kFirebaseAuth.currentUser;

    AuthCredential credential =
        EmailAuthProvider.credential(email: email!, password: pass!);

    await user!.reauthenticateWithCredential(credential).then((value) {
      value.user!.delete();
    });
  }
}
