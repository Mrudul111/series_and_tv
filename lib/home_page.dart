import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'join_page.dart';
import 'login_page.dart';
import 'global_variables.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBDBB2),
      drawer: Drawer(
        width: 200,
        child: ListView(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://static.wikia.nocookie.net/villains/images/7/7b/Tylerbetterpicture.jpg/revision/latest?cb=20170410170911'),
              radius: 50,
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Container(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('users').where('email', isEqualTo: email).snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.docs.isNotEmpty) {
                      String name = snapshot.data!.docs[0]['name'];
                      return Container(
                        child: Text(name),
                      );
                    } else {
                      return Container(
                        child: Text('No user found'),
                      );
                    }
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Container(
                      child: Text('Loading...'),
                    );
                  }
                },
              ),
            ),


            Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            ListTile(
              leading: Icon(Icons.search),
              title: Text("Search"),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
            ),
            ListTile(
              leading: Icon(Icons.menu_book),
              title: Text("Reviews"),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("List"),
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text("Watchlist"),
            ),
            GestureDetector(
              child: ListTile(
                leading: Icon(Icons.person_off_rounded),
                title: Text("Signout"),

              ),
              onTap: () async{
                await FirebaseAuth.instance.signOut();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF7C6F64),
      ),
    );
  }
}

// ElevatedButton(
// onPressed: () {
// FirebaseAuth.instance.signOut(); // Sign out the user
// Navigator.pushAndRemoveUntil(
// context,
// MaterialPageRoute(builder: (context) => loginPage()),
// (route) => false,
// );
// },
// child: Text('Sign Out'),
// )
