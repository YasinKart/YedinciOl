import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/src/painting/text_style.dart';

import 'main_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  /* Query dbRef = FirebaseDatabase.instance.ref().child('users');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('users');*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      'https://www.pngall.com/wp-content/uploads/5/Profile-Male-PNG.png',
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildInfoRow('Ad', 'Hakan'),
                  _buildInfoRow('Soyad', 'Çaçur'),
                  _buildInfoRow('Yaş', '35'),
                  _buildInfoRow('Boy', '195'),
                  _buildInfoRow('Kilo', '120'),
                  _buildInfoRow('Pozisyon', 'Orta Saha'),
                  _buildInfoRow('Güçlü Ayak', 'Sağ'),
                  _buildInfoRow('İletişim', '+90 555 555 55 55'),
                  _buildInfoRow('Şehir', 'Iğdır'),
                  _buildInfoRow('Tuttuğu Takım', 'Beşiktaş'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Image.network(
              'https://galeri14.uludagsozluk.com/805/en-iyi-hali-saha-taktikleri_1643717.jpg',
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label + ':',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(width: 10),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}