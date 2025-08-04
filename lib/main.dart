import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget { 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      initialRoute: '/', 
      routes: { 
        '/': (context) => HomePage(), 
        '/page1': (context) => Page1(), 
        '/page2': (context) => Page2(), 
        '/page3': (context) => Page3(), 
      }, 
    ); 
  } 
} 

class HomePage extends StatelessWidget { 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(title: Text(' Home Page')), 
      body: Center( 
        child: ElevatedButton( 
          child: Text('Go to Page 1'), 
          onPressed: () { 
            Navigator.pushNamed(context, '/page1'); 
          },
           ), 
      ), 
    ); 
  } 
} 
 
class Page1 extends StatelessWidget { 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(title: Text('Page 1')), 
      body: Center( 
        child: ElevatedButton( 
          child: Text('Go to Page 2'), 
          onPressed: () { 
            Navigator.pushNamed(context, '/page2'); 
          }, 
        ), 
      ), 
    ); 
  } 
} 
 
class Page2 extends StatelessWidget { 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(title: Text('Page 2')), 
      body: Center( 
        child: ElevatedButton( 
          child: Text('Go to Page 3'), 
          onPressed: () { 
            Navigator.pushNamed(context, '/page3'); 
          }, 
        ), 
      ),
       ); 
  } 
} 
 
class Page3 extends StatelessWidget { 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(title: Text('Page 3')), 
      body: Center( 
        child: ElevatedButton( 
          child: Text('Back to Home Page'), 
          onPressed: () { 
            Navigator.popUntil(context, ModalRoute.withName('/')); 
          }, 
        ), 
      ), 
    ); 
  } 
}
