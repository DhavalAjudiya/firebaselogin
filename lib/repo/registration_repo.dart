import 'package:firebaselogin/constant/const.dart';

class AuthRepo {
  static Future registrationRepo({String? email, String? pass}) async {
    try {
      await kFirebaseAuth.createUserWithEmailAndPassword(
          email: email!, password: pass!);
    } catch (e) {
      print("registration eroor ==> $e");
    }
  }
}
