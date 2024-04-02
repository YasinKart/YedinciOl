import 'package:bitirmeprojesi/auth_page.dart';
import 'package:bitirmeprojesi/components/my_bottom_nav_bar.dart';
import 'package:bitirmeprojesi/components/my_drawer.dart';
import 'package:bitirmeprojesi/login_page.dart';
import 'package:bitirmeprojesi/home_page.dart';
import 'package:bitirmeprojesi/profile_page.dart';
import 'package:bitirmeprojesi/profile_team_page.dart';
import 'package:bitirmeprojesi/search_page.dart';
import 'package:bitirmeprojesi/setting_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}
@override
Widget build(BuildContext context){
  return Scaffold(
    body: StreamBuilder<User?> (
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.hasData) {
            return HomePage();
          }
          else {
            return AuthPage();
          }
        }
    ),
  );
}
  class _MainPageState extends State<MainPage> {
  // This selected index is to control the bottom nav bar
     int _selectedIndex = 0;

  // This method will update our selected index
  // when the user taps on the bottom nav bar
  void navigateBottomBar(int index) {
     setState(() {
      _selectedIndex = index;
         }
         );
  }

  // pages to display
  final List<Widget> _pages = [
  // home page
  const HomePage(),

  // search page
  const SearchPage(),

  // profile page
  const ProfilePage(),

  //profile team page
  const ProfileTeamPage(),

  // setting page
  const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {

  return Scaffold(
  backgroundColor: Colors.grey[300],
  appBar: AppBar(
  elevation: 0,
  backgroundColor: Colors.blue.shade800,
  leading: Builder(
  builder: (context) => IconButton(
  icon: Icon(
  Icons.menu,
  color: Colors.black,
  ),
  onPressed: () => Scaffold.of(context).openDrawer(),
  ),
  ),
  title: Text(
  'Yedinci Ol',
  style: TextStyle(color: Colors.black),
  ),
  ),
  drawer: const MyDrawer(),
  body: _pages[_selectedIndex],
  bottomNavigationBar: MyBottomNavBar(
  onTabChange: (index) => navigateBottomBar(index),
  ),
  );
  }
  }
