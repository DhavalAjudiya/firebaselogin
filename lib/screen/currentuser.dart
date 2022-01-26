import 'package:firebaselogin/constant/const.dart';
import 'package:firebaselogin/repo/logout_repo.dart';
import 'package:firebaselogin/screen/login.dart';
import 'package:firebaselogin/screen/registration.dart';
import 'package:flutter/material.dart';

class CurrentUser extends StatefulWidget {
  const CurrentUser({Key? key}) : super(key: key);

  @override
  _CurrentUserState createState() => _CurrentUserState();
}

class _CurrentUserState extends State<CurrentUser> {
  final _email = TextEditingController();

  final _pass = TextEditingController();
  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("FireBase "),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 150, right: 10, left: 10),
        child: Column(
          children: [
            Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                child: Text(
                  "${kFirebaseAuth.currentUser!.email}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              height: 50,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(7)),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                child: Text(
                  "${kFirebaseAuth.currentUser!.uid}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              height: 50,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(7)),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                AuthRepo.logout();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ));
              },
              child: Text("LogOut"),
            ),
          ],
        ),
      ),
    );
  }
}
