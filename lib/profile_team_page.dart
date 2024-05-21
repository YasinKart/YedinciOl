import 'package:bitirmeprojesi/teams/team_a.dart';
import 'package:bitirmeprojesi/teams/team_b.dart';
import 'package:bitirmeprojesi/teams/team_c.dart';
import 'package:bitirmeprojesi/teams/team_d.dart';
import 'package:bitirmeprojesi/teams/team_e.dart';
import 'package:flutter/material.dart';

class ProfileTeamPage extends StatefulWidget {
  const ProfileTeamPage({super.key});

  @override
  State<ProfileTeamPage> createState() => _ProfileTeamPageState();
}

class _ProfileTeamPageState extends State<ProfileTeamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            Center(
              child: Text(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                  'TAKIMLAR'),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TeamAPage(),
                  ),
                );
              },
              child: Column(
                children: [
                  Center(
                    child: Text(
                        style: TextStyle(fontWeight: FontWeight.bold),
                        'A-TAKIMI'),
                  ),
                  Container(
                    color: Colors.white,
                    child: Center(
                      child: Image.network(
                          'https://media.istockphoto.com/id/1371065047/tr/fotoğraf/portrait-of-caucasian-male-soccer-team.jpg?s=2048x2048&w=is&k=20&c=VD1AYiqT1E8ZZTtoONSSMafV3GvClHdXqBNCSHHMtQU='),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TeamBPage()),
                );
              },
              child: Column(
                children: [
                  Center(
                    child: Text(
                        style: TextStyle(fontWeight: FontWeight.bold),
                        "B-TAKIMI"),
                  ),
                  Container(
                    color: Colors.white,
                    child: Center(
                        child: Image.network(
                            'https://media.istockphoto.com/id/75404971/tr/fotoğraf/portrait-of-a-football-team.jpg?s=2048x2048&w=is&k=20&c=EzONxgFo4pEy0cmB5GDerugEruTp9qD893DOnFmdfto=')),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TeamCPage()),
                );
              },
              child: Column(
                children: [
                  Center(
                    child: Text(
                        style: TextStyle(fontWeight: FontWeight.bold),
                        "C-TAKIMI"),
                  ),
                  Container(
                    color: Colors.white,
                    child: Center(
                        child: Image.network(
                            'https://media.istockphoto.com/id/485408415/tr/fotoğraf/happy-soccer-team.jpg?s=2048x2048&w=is&k=20&c=nCbDDtuFi7y6uUduDcSe5kYB-M5gYH5wy2yeENWenVY=')),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TeamDPage()),
                );
              },
              child: Column(
                children: [
                  Center(
                    child: Text(
                        style: TextStyle(fontWeight: FontWeight.bold),
                        "D-TAKIMI"),
                  ),
                  Container(
                    height: 200,
                    color: Colors.white,
                    child: Center(
                        child: Image.network(
                            'https://media.istockphoto.com/id/1161534912/tr/fotoğraf/profesyonel-futbolcular-ekibi-bir-futbol-sahası-kaleci-oturan-ve-gülümseyen-bir-grup.jpg?s=2048x2048&w=is&k=20&c=Fe4tHsS_R9Pb2_Rgp4h3dy-9-Iz5fEi751i3d4E-yJ4=')),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TeamEPage(),
                  ),
                );
              },
              child: Column(
                children: [
                  Center(
                    child: Text(
                        style: TextStyle(fontWeight: FontWeight.bold),
                        "E-TAKIMI"),
                  ),
                  Container(
                    color: Colors.white,
                    child: Center(
                        child: Image.network(
                            'https://media.istockphoto.com/id/453217147/tr/fotoğraf/soccer-team.jpg?s=2048x2048&w=is&k=20&c=k0b9kD5LNk8bEsV7JiH9mBZiPhBLiDkWdfNa2yGdju8=')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}