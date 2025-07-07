import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 12, 106, 194),
          title: const Text('Picture Text Button'),
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(), // เปลี่ยนเพื่อให้เลื่อนได้
            children: [
              // Box 1
              Container(
                color: const Color.fromARGB(255, 194, 12, 12),
                width: 350,
                height: 200,
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Image.asset(
                      'asset/images/pic.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                          const Text(
                            'Box 1 Title',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            textAlign: TextAlign.left,
                          ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Click Me'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Box 2
              Container(
                color: const Color.fromARGB(255, 12, 106, 194),
                width: 350,
                height: 200,
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Image.asset(
                      'asset/images/pic.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Box 2 Title',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Click Me'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Box 3
              Container(
                color: const Color.fromARGB(255, 20, 150, 50),
                width: 350,
                height: 200,
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Image.asset(
                      'asset/images/pic.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Box 3 Title',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Click Me'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Box 4 (ใหม่ เพิ่มมา)
              Container(
                color: const Color.fromARGB(255, 120, 60, 180),
                width: 350,
                height: 200,
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Image.asset(
                      'asset/images/pic.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Box 4 Title',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Click Me'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
