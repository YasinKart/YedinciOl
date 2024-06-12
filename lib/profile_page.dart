import 'dart:ffi';
import 'package:bitirmeprojesi/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/src/painting/text_style.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, String> profileData = {
    'name': '',
    'surname': '',
    'age': '',
    'height': '',
    'weight': '',
    'position': '',
    'foot': '',
    'contact': '',
    'city': '',
    'team': '',
  };

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
                  _buildInfoRow('Ad', profileData['name']!),
                  _buildInfoRow('Soyad', profileData['surname']!),
                  _buildInfoRow('Yaş', profileData['age']!),
                  _buildInfoRow('Boy', profileData['height']!),
                  _buildInfoRow('Kilo', profileData['weight']!),
                  _buildInfoRow('Pozisyon', profileData['position']!),
                  _buildInfoRow('Güçlü Ayak', profileData['foot']!),
                  _buildInfoRow('İletişim', profileData['contact']!),
                  _buildInfoRow('Şehir', profileData['city']!),
                  _buildInfoRow('Tuttuğu Takım', profileData['team']!),
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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateProfileScreen(
                      profileData: profileData,
                      onUpdate: (updatedProfileData) {
                        setState(() {
                          profileData = updatedProfileData;
                        });
                      },
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[800], // Buton arka plan rengini mavi yapar
                foregroundColor: Colors.black, // Buton yazı rengini beyaz yapar
              ),
              child: Text('Profili Düzenle'),
            )


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
