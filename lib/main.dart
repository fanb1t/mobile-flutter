import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// การแจ้งเตือน rpovider เมื่อมีการเปลี่ยนแปลงข้อมูลจากlogicคำนวณจะส่งแจ้งเตือน UI
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => GenderProvider(),
      child: MyApp(),
    ),
  );
}

// Main app widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radio + Provider',
      home: GenderScreen(),
    );
  }
}

// State management class
class GenderProvider with ChangeNotifier {
  String? _selectedGender;

  String? get selectedGender => _selectedGender;

  void selectGender(String gender) {
    _selectedGender = gender;
    notifyListeners(); // ����� UI rebuild
  }

  void clearGender() {
    _selectedGender = null;
    notifyListeners();
  }
}

// UI widget
class GenderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final genderProvider = context.watch<GenderProvider>();  //  ที่สำคัญมีการสังเกตจาก  provider คำนวณ

    return Scaffold(
      appBar: AppBar(title: Text('Radio + Provider')),
      body: Column(
        children: [
          ListTile(
            title: Text("Male"),
            leading: Radio<String>(
              value: "Male",
              groupValue: genderProvider.selectedGender,
              onChanged: (value) {
                genderProvider.selectGender(value!);
              },
            ),
          ),
          ListTile(
            title: Text("Female"),
            leading: Radio<String>(
              value: "Female",
              groupValue: genderProvider.selectedGender,
              onChanged: (value) {
                genderProvider.selectGender(value!);
              },
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            title: Text("other"),
            leading: Radio<String>(
              value: "other",
              groupValue: genderProvider.selectedGender,
              onChanged: (value) {
                genderProvider.selectGender(value!);
              },
            ),
          ),
          SizedBox(height: 20),
          Text(
            genderProvider.selectedGender == null
                ? "Please select gender"
                : "You selected: ${genderProvider.selectedGender}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => genderProvider.clearGender(),
            child: Text("Clear"),
          ),
        ],
      ),
    );
  }
}
