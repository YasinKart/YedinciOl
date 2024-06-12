import 'package:bitirmeprojesi/main_page.dart';
import 'package:bitirmeprojesi/profile_team_page.dart';
import 'package:bitirmeprojesi/teams/team_e_join.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class TeamEPage extends StatefulWidget {
  const TeamEPage({Key? key}) : super(key: key);

  @override
  State<TeamEPage> createState() => _TeamEPageState();
}

class _TeamEPageState extends State<TeamEPage> {
  Query dbRef = FirebaseDatabase.instance.ref().child('teame');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('teame');
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

  Widget listItem({required Map teame}) {
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
                        'Ad: ' + teame['AD'],
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Soyad: ' + teame['SOYAD'],
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Pozisyon: ' + teame['POZİSYON'],
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Yaş: ' + teame['YAŞ'],
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
                    'Maç: ' + teame['MAÇ'],
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
                    'Gol: ' + teame['GOL'],
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
                    'Asist: ' + teame['ASİST'],
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
                    'Sarı Kart: ' + teame['SARI'],
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
                    'Kırmızı Kart: ' + teame['KIRMIZI'],
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
        title: const Text('E Takımı'),
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
                  Map teame = snapshot.value as Map;
                  teame['ID'] = snapshot.key;

                  return listItem(teame: teame);
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TeamEJoinPage(),
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
