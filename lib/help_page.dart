import 'package:bitirmeprojesi/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'components/my_bottom_nav_bar.dart';
import 'components/my_drawer.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MainPage(),
              ),
            );
          },
        ),
        backgroundColor: Colors.blue[800],
        elevation: 0,
        title: Text(
          'Yardım',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Icon(Icons.sports_soccer, size: 100, color: Colors.blue[800]),
            Center(
              child: Text(
                '''Hoşgeldiniz
    ''',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
                child: Text(
              textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16.0,

                  ),
              'Yedinci Ol! uygulamasının yardım sayfasına hoş geldiniz. Bu sayfa, uygulamanın kullanımı ve temel özellikleri hakkında size rehberlik etmek için tasarlanmıştır.',
            )),
            SizedBox(height: 20),
            Center(
              child: Text(
                '''
    Soldaki Çekmeceler
    ''',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
                child: Text(
              textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
              'Sol taraftaki çekmeli sayfadan "Hakkımızda" bölümüne erişebilirsiniz. Aynı zamanda ana sayfaya dönüş ve çıkış işlemleri için bu menüyü kullanabilirsiniz. ',
            )),
            SizedBox(height: 30),
            Center(
              child: Text(
                '''
    Navigasyon Bar
    ''',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                '''
    Alt kısımdaki navigasyon çubuğu, uygulamanın ana bölümlerine hızlıca erişmenizi sağlar:
    - Ana Sayfa: Anlık haberleri ve bildirimleri görün.
    - Arama: Takım, oyuncu ve halı saha aramak için.
    - Profil: Kendi profilinizi yönetin.
    - Takım: Takımınızı oluşturun veya katılın.
    - Ayarlar: Uygulama ayarlarınızı özelleştirin.
    ''',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
