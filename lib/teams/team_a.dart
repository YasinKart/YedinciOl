import 'package:bitirmeprojesi/main_page.dart';
import 'package:bitirmeprojesi/profile_team_page.dart';
import 'package:bitirmeprojesi/teams/team_a_join.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class TeamAPage extends StatefulWidget {
  const TeamAPage({Key? key}) : super(key: key);

  @override
  State<TeamAPage> createState() => _TeamAPageState();
}

class _TeamAPageState extends State<TeamAPage> {
  Query dbRef = FirebaseDatabase.instance.ref().child('teama');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('teama');
  final TextEditingController _searchController = TextEditingController();
  int teamCount = 0;

  @override
  void initState() {
    super.initState();
    getTeamCount();
  }

  Future<void> getTeamCount() async {
    DataSnapshot snapshot = await reference.get();
    setState(() {
      teamCount = snapshot.children.length;
    });
  }

  Widget listItem({required Map teama}) {
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
                        'Ad: ' + teama['AD'],
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Soyad: ' + teama['SOYAD'],
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Pozisyon: ' + teama['POZİSYON'],
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Yaş: ' + teama['YAŞ'],
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
                    'Maç: ' + teama['MAÇ'],
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
                    'Gol: ' + teama['GOL'],
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
                    'Asist: ' + teama['ASİST'],
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
                    'Sarı Kart: ' + teama['SARI'],
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
                    'Kırmızı Kart: ' + teama['KIRMIZI'],
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
        title: const Text('A Takımı'),
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
            Text(
              'Takımda $teamCount Kişi Var',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: FirebaseAnimatedList(
                query: dbRef,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  Map teama = snapshot.value as Map;
                  teama['ID'] = snapshot.key;

                  return listItem(teama: teama);
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TeamAJoinPage(),
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
