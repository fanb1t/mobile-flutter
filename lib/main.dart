import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'งานอดิเรก',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Hobby(),
    );
  }
}

class Hobby extends StatefulWidget {
  const Hobby({super.key});

  @override
  _HobbyState createState() => _HobbyState();
}

class _HobbyState extends State<Hobby> {
  bool _sport = false;
  bool _game = false;
  bool _book = false;
  bool _sereis = false;
  bool _music = false;
  bool _code = false;

  int get selectedCount => (_sport ? 1 : 0) + (_game ? 1 : 0) + (_book ? 1 : 0) +(_sereis ? 1 : 0) + (_music ? 1 : 0) + (_code ? 1 : 0) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('เลือกจำนวนงานอดิเรก')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // เล่นกีฬา
            ListTile(
              leading: Checkbox(
                value: _sport,
                onChanged: (bool? val) {
                  setState(() {
                    _sport = val ?? false;
                  });
                },
              ),
              title: const Text('เล่นกีฬา'),
            ),
            // เล่นเกม
            ListTile(
              leading: Checkbox(
                value: _game,
                onChanged: (bool? val) {
                  setState(() {
                    _game = val ?? false;
                  });
                },
              ),
              title: const Text('เล่นเกม'),
            ),
            // อ่านหนังสือ
            ListTile(
              leading: Checkbox(
                value: _book,
                onChanged: (bool? val) {
                  setState(() {
                    _book = val ?? false;
                  });
                },
              ),
              title: const Text('อ่านหนังสือ'),
            ),
            // ดูซีรีส์
            ListTile(
              leading: Checkbox(
                value: _sereis,
                onChanged: (bool? val) {
                  setState(() {
                    _sereis = val ?? false;
                  });
                },
              ),
              title: const Text('ดูซีริส์'),
            ),
            // ฟังเพลง
            ListTile(
              leading: Checkbox(
                value: _music,
                onChanged: (bool? val) {
                  setState(() {
                    _music = val ?? false;
                  });
                },
              ),
              title: const Text('ฟังเพลง'),
            ),
            // เขียนโค้ด
            ListTile(
              leading: Checkbox(
                value: _code,
                onChanged: (bool? val) {
                  setState(() {
                    _code = val ?? false;
                  });
                },
              ),
              title: const Text('เขียนโค้ด'),
            ),
            const SizedBox(height: 20),
            Text(
              selectedCount == 0
                  ? 'กรุณาเลือกงานอดิเรก'
                  : (selectedCount > 4
                      ? 'คุณเลือกงานอดิเรกมากเกินไป'
                      : 'คุณเลือกงานอดิเรก $selectedCount อย่าง'),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
