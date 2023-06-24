import 'package:flutter/material.dart';
import 'package:series_and_tv/auth.dart';
import 'package:series_and_tv/join_page.dart';
import 'forgot_pass_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'global_variables.dart';
import 'home_page.dart';
import 'main.dart';
class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}
class _loginPageState extends State<loginPage> {

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/login.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding:
                        EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
                    child: Text(
                      "Sign in to TVboxd",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFEFF1F3)),
                    ),
                  ),
                  Form(
                    key: _formKey, // Add this line to associate the form key with the Form widget
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15.0, right: 15.0),
                          child: TextFormField(
                            cursorColor: Color(0xFF121035),
                            decoration: InputDecoration(
                                labelText: 'Username or Email',
                                floatingLabelStyle:
                                TextStyle(color: Color(0xFF121035)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF121035)))
                              // Add other desired TextField properties
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter username/email";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value){
                              email = value!;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 30),
                          child: TextFormField(
                            cursorColor: Color(0xFF121035),
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: 'Password',
                                floatingLabelStyle:
                                TextStyle(color: Color(0xFF121035)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF121035)))
                              // Add other desired TextField properties
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Password';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value){
                              pass = value!;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 15.0),
                      SizedBox(
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation, secondaryAnimation) => joinPage(),
                                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                      var begin = Offset(-1.0, 0.0);
                                      var end = Offset.zero;
                                      var tween = Tween(begin: begin, end: end);
                                      var offsetAnimation = animation.drive(tween);

                                      return SlideTransition(
                                        position: offsetAnimation,
                                        child: child,
                                      );
                                    },
                                  ),
                                );


                              });
                            },
                            child: Text("JOIN"),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF7F6F62),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          )),
                      SizedBox(width: 15.0),
                      SizedBox(
                          height: 30,
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) => forgotPasswordPage(),
                                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                        var begin = Offset(1.0, 0.0);
                                        var end = Offset.zero;
                                        var tween = Tween(begin: begin, end: end);
                                        var offsetAnimation = animation.drive(tween);

                                        return SlideTransition(
                                          position: offsetAnimation,
                                          child: child,
                                        );
                                      },
                                    ),
                                  );


                                });
                              },
                              child: Text("FORGOT PASSWORD"),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF7F6F62),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10))))),
                      SizedBox(width: 15.0),
                      SizedBox(
                          height: 30,
                          child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  bool success = await AuthServices.signinUser(email, pass, context);
                                  if (success) {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => homePage()));
                                  }
                                }
                              },

                              child: Text("GO"),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFB64236),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
