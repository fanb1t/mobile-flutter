import 'package:flutter/material.dart'; 
import 'second_page.dart'; 
void main() => runApp(MaterialApp(home: FirstPage())); 
class FirstPage extends StatelessWidget { 
@override 
Widget build(BuildContext context) { 
final String messageToSend = "Hello from First Page!"; 
return Scaffold( 
appBar: AppBar(title: Text('First Page')), 
body: Center( 
child: ElevatedButton( 
child: Text('Go to Second Page'), 
onPressed: () async { 
// Navigate to SecondPage and send data via constructor 
final result = await Navigator.push(
  context, 
              MaterialPageRoute( 
                builder: (context) => SecondPage(data: messageToSend), 
              ), 
            ); 
 
            // Show returned result from SecondPage using a SnackBar 
            ScaffoldMessenger.of(context).showSnackBar( 
              SnackBar(content: Text('Returned: $result')), 
            ); 
          }, 
        ), 
      ), 
    ); 
  } 
}