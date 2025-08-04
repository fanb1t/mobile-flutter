import 'package:flutter/material.dart'; 
import 'home_page.dart'; // import the separated file 
 
void main() { 
  runApp(MyApp()); 
} 
 
class MyApp extends StatelessWidget { 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      title: 'Flutter Home Example', 
      home: HomePage(), // set the home screen 
    ); 
  } 
}