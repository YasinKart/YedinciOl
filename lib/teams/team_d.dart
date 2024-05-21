import 'package:bitirmeprojesi/main_page.dart';
import 'package:bitirmeprojesi/teams/team_d_join.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class TeamDPage extends StatefulWidget {
  const TeamDPage({Key? key}) : super(key: key);

  @override
  State<TeamDPage> createState() => _TeamDPageState();
}

class _TeamDPageState extends State<TeamDPage> {

  Query dbRef = FirebaseDatabase.instance.ref().child('teamd');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('teamd');
  final TextEditingController _searchController = TextEditingController();
  Widget listItem({required Map teamd}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Ad: ' + teamd['AD'],
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Soyad: ' + teamd['SOYAD'],
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Pozisyon: ' + teamd['POZİSYON'],
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Yaş: ' + teamd['YAŞ'],
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.network(
                      'https://www.pngall.com/wp-content/uploads/5/Profile-Male-PNG-Image.png',
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'İstatistikler: ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: const Icon(
                    Icons.group_add_rounded,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Maç: '+teamd['MAÇ'],
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: const Icon(
                    Icons.sports_soccer_rounded,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Gol: '+teamd['GOL'],
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: const Icon(
                    Icons.assistant_direction_outlined,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Asist: ' + teamd['ASİST'],
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: const Icon(
                    Icons.square_rounded,
                    color: Colors.yellow,
                  ),
                  title: Text(
                    'Sarı Kart: '+teamd['SARI'],
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: const Icon(
                    Icons.square_rounded,
                    color: Colors.red,
                  ),
                  title: Text(
                    'Kırmızı Kart: '+teamd['KIRMIZI'],
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue.shade800,
        title: Text('D Takımı'),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MainPage(),
              ),
            );
          },
        ),
      ),
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: FirebaseAnimatedList(
                query: dbRef,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  Map teamd = snapshot.value as Map;
                  teamd['ID'] = snapshot.key;

                  return listItem(teamd: teamd);
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TeamDJoinPage(),
                  ),
                );
              },
              child: const Text('Takıma Katıl'),
            ),
          ],
        ),
      ),
    );
  }
}
