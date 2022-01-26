import 'package:firebaselogin/constant/const.dart';

class AuthRepo {
  static logout() {
    kFirebaseAuth.signOut();
  }
}
