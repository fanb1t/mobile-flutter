import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          int index = 0;
          return StatefulBuilder(
            builder: (context, setState) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Myapp'),
                  backgroundColor: Colors.red.shade700,
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Page ${index + 5}',
                          style: const TextStyle(fontSize: 24, color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        const SizedBox(width: 16),
                        const Text(
                          'Text 2',
                          style: TextStyle(fontSize: 24, color: Colors.yellow),
                        ),
                        const SizedBox(width: 16),
                        const Text(
                          'Text 3',
                          style: TextStyle(fontSize: 24, color: Colors.green),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      color: Colors.blue,
                      alignment: Alignment.center,
                      child: const Text(
                        'Hello World',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print('Button pressed!');
                      },
                      child: Text('Click Me'),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(2, 4),
                            ),
                          ],
                        ),
                        clipBehavior: Clip.antiAlias, // image curve borderRadius
                        child: Image.asset(
                          'asset/images/pic.jpg',
                          fit: BoxFit.cover, // fit to container 
                        ),
                      ),
                    ),

                  ],
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    // ใส่โค้ดที่ต้องการให้ทำเมื่อกดปุ่ม
                  },
                  child: const Icon(Icons.add),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: index,
                  onTap: (i) => setState(() => index = i),
                  items: const [
                    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                    BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
                    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
