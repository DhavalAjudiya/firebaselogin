import 'package:firebaselogin/repo/login_repo.dart';
import 'package:firebaselogin/screen/currentuser.dart';
import 'package:firebaselogin/screen/registration.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

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
        key: _globalKey,
        backgroundColor: Colors.purple,
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text("Login "),
        ),
        body: SingleChildScrollView(
          child: Padding(
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
                              counter: Column(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      AuthRepo.passwordreset(
                                              context: context,
                                              email: _email.text)
                                          .then((value) {
                                        ScaffoldMessenger.of(context!)
                                            .showSnackBar(
                                          SnackBar(
                                            duration:
                                                Duration(microseconds: 600),
                                            content: Text(
                                                "Password Reset email link is been sent"),
                                          ),
                                        );
                                      }).catchError((onError) {
                                        ScaffoldMessenger.of(context!)
                                            .showSnackBar(
                                          SnackBar(
                                            content:
                                                Text("Error In Email Reset"),
                                          ),
                                        );
                                      });
                                    },
                                    child: Text(
                                      "Forget Password",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.black,
                                          wordSpacing: 2,
                                          fontSize: 15),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      AuthRepo.deleteaccount(
                                              context: context,
                                              email: _email.text,
                                              pass: _pass.text)
                                          .then((res) {
                                        ScaffoldMessenger.of(context!)
                                            .showSnackBar(
                                          SnackBar(
                                            duration:
                                                Duration(milliseconds: 600),
                                            content:
                                                Text("User Account Deleted"),
                                          ),
                                        );
                                      }).catchError((onError) {
                                        ScaffoldMessenger.of(context!)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text("Credential Error"),
                                          ),
                                        );
                                      });

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LoginScreen(),
                                          ));
                                    },
                                    child: Text(
                                      "Delete Account",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.black,
                                          wordSpacing: 2,
                                          fontSize: 15),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LoginScreen(),
                                          ));
                                    },
                                    child: Text(
                                      "RAGISTRATION",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.black,
                                          wordSpacing: 2,
                                          fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                              labelText: "password",
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              filled: true,
                              fillColor: Colors.black38,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        RaisedButton(
                          color: Colors.pink,
                          splashColor: Colors.black,
                          highlightColor: Colors.red,
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              bool status = await AuthRepo.loginRepo(
                                  email: _email.text, pass: _pass.text);

                              if (status == true) {

                                Fluttertoast.showToast(msg: "Login Success");
                                // showDialog(
                                //     context: context,
                                //     builder: (context) => AlertDialog(
                                //           backgroundColor: Colors.black,
                                //           insetPadding: EdgeInsets.only(
                                //               top: 350, right: 80, left: 80),
                                //           actions: [
                                //             Container(
                                //               child: Text(
                                //                 "Login Success",
                                //                 style: TextStyle(
                                //                     color: Colors.white),
                                //               ),
                                //               height: 20,
                                //               alignment: Alignment.center,
                                //               decoration: BoxDecoration(
                                //                   color: Colors.black,
                                //                   borderRadius:
                                //                       BorderRadius.circular(7)),
                                //             ),
                                //           ],
                                //         )).then((value) {
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (context) => CurrentUser()));
                                // });
                              } else {
                                       Fluttertoast.showToast(msg: "Login Field");
                                // showDialog(
                                //     context: context,
                                //     builder: (context) => AlertDialog(
                                //           backgroundColor: Colors.black,
                                //           insetPadding: EdgeInsets.only(
                                //               top: 350, right: 80, left: 80),
                                //           actions: [
                                //             Container(
                                //               child: Text(
                                //                 "Login Failed",
                                //                 style: TextStyle(
                                //                     color: Colors.white),
                                //               ),
                                //               height: 20,
                                //               alignment: Alignment.center,
                                //               decoration: BoxDecoration(
                                //                   color: Colors.black,
                                //                   borderRadius:
                                //                       BorderRadius.circular(7)),
                                //             ),
                                //           ],
                                //         ));
                              }
                            }
                          },
                          child: Text("Login"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
