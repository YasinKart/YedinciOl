import 'package:bitirmeprojesi/about_page.dart';
import 'package:bitirmeprojesi/home_page.dart';
import 'package:bitirmeprojesi/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  get user => FirebaseAuth.instance.currentUser!;

  // method to log user out
  void logUserOut(BuildContext context) {
    // pop drawer
    Navigator.pop(context);
    // pop app
    Navigator.pop(context);
    // go back to login page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(
          showRegisterPage: () {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue[200],
      child: Column(
        children: [
          // Drawer header
          const DrawerHeader(
            child: Center(
              child: Icon(
                Icons.sports_soccer,
                color: Colors.black,
                size: 90,
              ),
            ),
          ),

          const SizedBox(height: 40),

          //profile
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ListTile(
              leading: const Icon(
                Icons.perm_identity_rounded,
                color: Colors.black,
              ),
              onTap: () {},
              title: Text(
                user.email!+' olarak giriş yapıldı',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          //home page
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              child: ListTile(
                leading: Icon(
                  Icons.home_rounded,
                  color: Colors.black,
                ),
                title: Text(
                  "Ana Sayfa",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),


          /*
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  SettingPage(),
                  ),
                );
              },
              child: ListTile(
                leading: Icon(
                  Icons.settings_rounded,
                  color: Colors.black,
                ),
                title: Text(
                  "Ana Sayfa",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          */

          // ABOUT PAGE
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutPage(),
                  ),
                );
              },
              child: ListTile(
                leading: Icon(
                  Icons.info,
                  color: Colors.black,
                ),
                title: Text(
                  "Hakkında",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),

          // LOGOUT BUTTON
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
              onTap: () => logUserOut(context),
              title: Text(
                "Çıkış Yap",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}