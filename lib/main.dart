import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HobbyPage());
  }
}

// โมเดลแบบ OOP สำหรับเก็บข้อมูลแต่ละ checkbox
class HobbyItem {
  final String name;
  bool selected;
  HobbyItem(this.name, {this.selected = false});
}

class HobbyPage extends StatefulWidget {
  const HobbyPage({super.key});
  @override
  State<HobbyPage> createState() => _HobbyPageState();
}

class _HobbyPageState extends State<HobbyPage> {
  final List<HobbyItem> _items = [
    HobbyItem('เล่นกีฬา'),
    HobbyItem('เล่นเกม'),
    HobbyItem('อ่านหนังสือ'),
    HobbyItem('ดูซีรีส์'),
    HobbyItem('ฟังเพลง'),
    HobbyItem('เขียนโค้ด'),
  ];

  final TextEditingController _controller = TextEditingController();
  final int maxSelected = 4; // เปลี่ยนค่าตามต้องการ

  int get selectedCount => _items.where((e) => e.selected).length;

  void _toggleItem(int index, bool? value) {
    final bool newVal = value ?? false;
    // บังคับจำกัดจำนวน ถ้าพยายามเลือกเพิ่มเมื่อถึง limit ให้แจ้งเตือน
    if (newVal && selectedCount >= maxSelected) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('คุณไม่สามารถเลือกเกิน $maxSelected งานอดิเรก')),
      );
      return;
    }

    setState(() {
      _items[index].selected = newVal;
    });
  }

  void _addItem() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _items.add(HobbyItem(text));
      _controller.clear();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: _items.length,
      itemBuilder: (context, i) {
        final item = _items[i];
        return CheckboxListTile(
          title: Text(item.name),
          value: item.selected,
          onChanged: (v) => _toggleItem(i, v),
          controlAffinity: ListTileControlAffinity.leading,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('เลือกงานอดิเรก (แบบ OOP)')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // ช่องเพิ่มรายการใหม่ (optional)
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'เพิ่มงานอดิเรกใหม่',
                      hintText: 'เช่น วาดรูป, ปลูกต้นไม้',
                    ),
                    onSubmitted: (_) => _addItem(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(onPressed: _addItem, child: const Text('เพิ่ม')),
              ],
            ),
            const SizedBox(height: 12),

            // รายการ checkbox (เลื่อนดูได้)
            Expanded(child: _buildList()),

            const SizedBox(height: 12),

            // ข้อความสรุป + ข้อความเตือน (แยก widget เพื่อความชัดเจน)
            Text(
              selectedCount == 0
                  ? 'กรุณาเลือกงานอดิเรก'
                  : 'คุณเลือกงานอดิเรกทั้งหมด: $selectedCount',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            if (selectedCount > maxSelected)
              // กรณีนี้จริง ๆ จะไม่เกิดเพราะเราป้องกันไว้ก่อนหน้า แต่ยังคงใส่ไว้เป็นตัวอย่าง
              const Padding(
                padding: EdgeInsets.only(top: 6),
                child: Text(
                  'คุณเลือกมากเกินไป',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
