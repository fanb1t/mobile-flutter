import 'package:flutter/material.dart'; 
 
class SecondPage extends StatelessWidget { 
  final String data; 
 
  // Constructor that receives data from the previous screen 
  SecondPage({required this.data}); 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(title: Text('Second Page')), 
      body: Center( 
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [ 
            // Display the received data 
            Text('Received: $data'), 
SizedBox(height: 20), 
ElevatedButton( 
child: Text('Send back data'), 
onPressed: () { 
// Send result back to the previous screen 
Navigator.pop(context, 'Thanks from Second Page!'); 
}, 
), 
], 
), 
), 
); 
} 
}
