import 'package:firebase_core/firebase_core.dart';
import 'package:firebaselogin/screen/registration.dart';
import 'package:flutter/material.dart';

void main() async {
  /// initialize.  firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
