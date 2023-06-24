import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:series_and_tv/auth.dart';
import 'global_variables.dart';

class joinPage extends StatefulWidget {
  @override
  State<joinPage> createState() => _joinPageState();
}

class _joinPageState extends State<joinPage> {

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/join.jpg'), fit: BoxFit.cover)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:
                      EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
                      child: Text(
                        "Join TVboxd",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFEFF1F3)),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: TextFormField(
                              cursorColor: const Color(0xFF121035),
                              decoration: const InputDecoration(
                                labelText: 'Name',
                                floatingLabelStyle: TextStyle(color: Color(0xFF121035)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF121035))),

                                // Add other desired TextField properties
                              ),
                                validator: (value){
                                  if(value!.isEmpty){
                                    return 'Please enter Name';
                                  }
                                  else{
                                    return null;
                                  }
                                },
                              onSaved: (value){
                                name = value!;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15.0, right: 15.0),
                            child: TextFormField(
                              cursorColor: Color(0xFF121035),
                              decoration: const InputDecoration(
                                  labelText: 'Email',
                                  floatingLabelStyle:
                                      TextStyle(color: Color(0xFF121035)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF121035)))
                                  // Add other desired TextField properties
                                  ),
                                validator: (value){
                                  if(value!.isEmpty){
                                    return 'Please enter email';
                                  }
                                  if(!value!.contains("@") && !value!.contains(".")){
                                    return 'Enter a valid email';
                                  }
                                  else{
                                    return null;
                                  }
                                },
                                onSaved: (value){
                                  email = value!;
                                }
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: TextFormField(
                              cursorColor: const Color(0xFF121035),
                                obscureText: true,
                              decoration: const InputDecoration(
                                  labelText: 'Password',

                                  floatingLabelStyle:
                                      TextStyle(color: Color(0xFF121035)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF121035)))
                                  // Add other desired TextField properties
                                  ),
                                validator: (value){
                                pass = value!;
                                  if(value!.isEmpty){
                                    return 'Please enter Password';
                                  }
                                  else{
                                    return null;
                                  }
                                },
                              onSaved: (value){
                                pass = value!;
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 15.0, right: 15.0, bottom: 30),
                            child: TextFormField(
                              cursorColor: Color(0xFF121035),
                              obscureText: true,
                              decoration: const InputDecoration(
                                  labelText: 'Confirm Password',
                                  floatingLabelStyle:
                                      TextStyle(color: Color(0xFF121035)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF121035)))
                                  // Add other desired TextField properties
                                  ),
                              validator: (value){
                                conf_pass = value!;
                                  if(value!.isEmpty){
                                    return 'Confirm Password';
                                  }
                                  else if(!value!.isEmpty && value!!=pass){
                                    return 'Re-Enter Password';
                                  }
                                  else{
                                    return null;
                                  }
                                },

                            ),
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                  height: 30,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        if(_formKey.currentState!.validate()){
                                          _formKey.currentState!.save();
                                          AuthServices.signupUser(email, pass,name, context);
                                        }

                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFFB64236),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      child: Text("Create Account"))),
                              const SizedBox(
                                width: 15.0,
                              ),
                              SizedBox(
                                  height: 30,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          Navigator.pop(context);
                                        });
                                      },
                                      child: Text("Back"),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF7F6F62),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)))))
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
