import 'package:firebaselogin/repo/registration_repo.dart';
import 'package:firebaselogin/screen/login.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();

  final _pass = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal[700],
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text("Registration "),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardAppearance: Brightness.dark,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "* required";
                          } else {
                            return null;
                          }
                        },
                        cursorColor: Colors.white,
                        cursorHeight: 20,
                        style: TextStyle(color: Colors.amber),
                        controller: _email,
                        decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            filled: true,
                            fillColor: Colors.black38),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "* required";
                          } else {
                            return null;
                          }
                        },
                        cursorColor: Colors.white,
                        cursorHeight: 20,
                        style: TextStyle(color: Colors.amber),
                        controller: _pass,
                        decoration: InputDecoration(
                            labelText: "password",
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            filled: true,
                            fillColor: Colors.black38),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RaisedButton(
                        color: Colors.pink,
                        splashColor: Colors.black,
                        highlightColor: Colors.red,
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            AuthRepo.registrationRepo(
                                email: _email.text, pass: _pass.text);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ));
                          }
                        },
                        child: Text("Registration"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
