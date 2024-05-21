import 'package:bitirmeprojesi/teams/team_a.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../main_page.dart';

class TeamAJoinPage extends StatefulWidget {
  const TeamAJoinPage({super.key});

  @override
  State<TeamAJoinPage> createState() => _TeamAJoinPageState();
}

class _TeamAJoinPageState extends State<TeamAJoinPage> {
  final userIDController = TextEditingController();
  final userNameController = TextEditingController();
  final userSurnameController = TextEditingController();
  final userAgeController = TextEditingController();
  final userMatchController = TextEditingController();
  final userGoalController = TextEditingController();
  final userAssistController = TextEditingController();
  final userYellowController = TextEditingController();
  final userRedController = TextEditingController();
  final userPositionController = TextEditingController();
  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('teama');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue.shade800,
        title: Text('Veritabanına Sporcu Ekle'),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TeamAPage(),
              ),
            );
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.network(
                  'https://www.pngall.com/wp-content/uploads/5/Profile-Male-PNG-Image.png',
                  height: 100,
                  width: 100,
                ),
                const SizedBox(
                  height: 25,
                ),

                TextField(
                  controller: userIDController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'ID',
                    hintText: 'ID Yazınız',
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: userNameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Ad',
                    hintText: 'Ad Yazınız',
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: userSurnameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Soyad',
                    hintText: 'Soyad Yazınız',
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: userAgeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Yaş',
                    hintText: 'Yaş Giriniz',
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: userMatchController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Maç',
                    hintText: 'Maç Sayısı Giriniz',
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: userGoalController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Gol',
                    hintText: 'Gol Sayısı Giriniz',
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: userAssistController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Asist',
                    hintText: 'Asist Sayısı Giriniz',
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: userYellowController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Sarı',
                    hintText: 'Sarı Kart Sayısı Giriniz',
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: userRedController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Kırmızı',
                    hintText: 'Kırmızı Kart Sayısı Giriniz',
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: userPositionController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Pozisyon',
                    hintText: 'Pozisyon Giriniz',
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                MaterialButton(
                  onPressed: () {
                    Map<String, String> users = {
                      'ID': userIDController.text,
                      'AD': userNameController.text,
                      'SOYAD': userSurnameController.text,
                      'YAŞ': userAgeController.text,
                      'MAÇ': userMatchController.text,
                      'GOL': userGoalController.text,
                      'ASİST': userAssistController.text,
                      'SARI': userYellowController.text,
                      'KIRMIZI': userRedController.text,
                      'POZİSYON': userPositionController.text,
                    };

                    dbRef.push().set(users);
                  },
                  child: const Text('Sporcu Ekle'),
                  color: Colors.blue,
                  textColor: Colors.black,
                  minWidth: 300,
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
