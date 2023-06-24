import 'package:flutter/material.dart';
class forgotPasswordPage extends StatefulWidget {
  const forgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<forgotPasswordPage> createState() => _forgotPasswordPageState();
}

class _forgotPasswordPageState extends State<forgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/forgot.jpg'),
                fit: BoxFit.cover,
              )
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                  child: TextField(
                    cursorColor: Color(0xFF121035),
                    decoration: InputDecoration(
                      labelText: 'Enter username or email',
                      floatingLabelStyle:
                      TextStyle(color: Color(0xFF121035)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF121035))),

                      // Add other desired TextField properties
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    SizedBox(width: 15,),
                    SizedBox(
                        height: 30,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text("Confirm"),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFB64236),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(10))))),
                    SizedBox(width: 15,),
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
