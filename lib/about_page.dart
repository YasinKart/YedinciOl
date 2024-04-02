import 'package:flutter/material.dart';



class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        elevation: 0,
        title: const Text(
          'Hakkımızda',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
        children: <Widget> [
          Icon(
            Icons.sports_soccer,
            size: 100,
              color: Colors.blue[800]
          ),

        const Center(
          child: Text(
            '''
    Hoş Geldiniz Futbol Severler!

    YEDİNCİ OL! uygulaması, futbolseverleri bir araya getirip eğlenceli bir futbol deneyimi yaşamalarına yardımcı olan bir platformdur. Amacımız, spor tutkunlarını buluşturarak boş halısahaları daha verimli bir şekilde değerlendirmelerini sağlamak ve futbol oynamak isteyen oyuncuların birbirlerini kolayca bulmalarını sağlamaktır.

    🌐 Uygulamamızda Neler Bulabilirsiniz?
    - Harita üzerinde boş halısahaları görüntüleyebilir,
    - Kendi oyuncu profi̇lini̇zi̇ oluşturabilir,
    - Takım arayan oyuncuları bulabilir,
    - Yeni takım arkadaşları edinebilir,
    - Futbol etkinliklerini takip edebilir,
    - Ve daha birçok özellik!

    ⚽ Biz, futbolun gücünü bir araya gelmekte ve birlikte eğlenmekte görüyoruz. Siz de Halısaha Bul ailesine katılın, spor dolu anılar biriktirin ve futbol tutkunuzun tadını çıkarın.

    🏆 Unutmayın, YEDİNCİ OL! ile herkes bir galibiyet kazanır!

    Spor dolu günler dileriz!
    ''',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        )



        ],
      ),
      ),
    );
  }
}
