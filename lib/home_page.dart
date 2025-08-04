import 'package:flutter/material.dart'; 
 
class HomePage extends StatelessWidget { 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(
        title: Text('first page'), 
        backgroundColor: Colors.lime[600],
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
), 
body: Center( 
child: Text('Welcome to the Home Page!'), 
), 
); 
} 
}