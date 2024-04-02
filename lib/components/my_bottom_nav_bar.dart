import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[800],
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: GNav(
        color: Colors.black,
        activeColor: Colors.black,
        tabBackgroundColor: Colors.blue.shade200,
        padding: const EdgeInsets.all(16),
        gap: 8,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(
            icon: Icons.home_rounded,
            text: 'Anasayfa',
          ),
          GButton(
            icon: Icons.search_rounded,
            text: 'Arama',
          ),
          GButton(
            icon: Icons.person_rounded,
            text: 'Profil',
          ),
          GButton(
            icon: Icons.people_rounded,
            text: 'Takım',
          ),
          GButton(
            icon: Icons.settings_rounded,
            text: 'Ayarlar',
          ),
        ],
      ),
    );
  }
}
