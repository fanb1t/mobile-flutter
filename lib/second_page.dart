import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String username;
  final int age;
  final bool isMember;

  // Receive multiple values via constructor
  SecondPage({
    required this.username,
    required this.age,
    required this.isMember,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Username: $username'),
            Text('Age: $age'),
            Text('Member: ${isMember ? "Yes" : "No"}'),
          ],
        ),
      ),
    );
  }
}
