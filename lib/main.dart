// lib/main.dart
import 'package:flutter/material.dart';
import 'summary_page.dart';
import 'db_helper-1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Management',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: UserPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  String _sex = 'Male'; // ค่าเริ่มต้น
  List<Map<String, dynamic>> _users = [];

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    final data = await DBHelper.getUsers();
    setState(() {
      _users = data;
    });
  }

  Future<void> _addUser() async {
    if (_idController.text.isEmpty ||
        _nameController.text.isEmpty ||
        _salaryController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    int? id = int.tryParse(_idController.text);
    double salary = double.tryParse(_salaryController.text) ?? -1;

    if (id == null || id <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ID must be a positive integer')),
      );
      return;
    }

    if (salary <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Salary must be a positive number')),
      );
      return;
    }

    bool exists = await DBHelper.isIdExists(id);
    if (exists) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ID $id already exists!')),
      );
      return;
    }

    Map<String, dynamic> newUser = {
      DBHelper.columnId: id,
      DBHelper.columnName: _nameController.text,
      DBHelper.columnSex: _sex,
      DBHelper.columnSalary: salary,
    };

    await DBHelper.insertUser(newUser);
    _clearInputs();
    _loadUsers();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('User added successfully')),
    );
  }

  void _clearInputs() {
    _idController.clear();
    _nameController.clear();
    _salaryController.clear();
    setState(() {
      _sex = 'Male';
    });
  }

  Future<void> _editUserDialog(int id, String name, String sex, double salary) async {
    TextEditingController nameCtrl = TextEditingController(text: name);
    TextEditingController salaryCtrl = TextEditingController(text: salary.toString());
    String? selectedSex = sex;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit User"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("ID: $id", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 10),
              TextField(
                controller: nameCtrl,
                decoration: InputDecoration(labelText: "Name"),
              ),
              SizedBox(height: 10),

              // Radio Button สำหรับ Sex
              Text('Sex:', style: TextStyle(fontSize: 16)),
              Row(
                children: [
                  SizedBox(width: 8),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Male',
                        groupValue: selectedSex,
                        onChanged: (value) {
                          selectedSex = value;
                        },
                      ),
                      Text('Male'),
                    ],
                  ),
                  SizedBox(width: 24),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Female',
                        groupValue: selectedSex,
                        onChanged: (value) {
                          selectedSex = value;
                        },
                      ),
                      Text('Female'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextField(
                controller: salaryCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Salary"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                if (nameCtrl.text.isEmpty || salaryCtrl.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('All fields are required')),
                  );
                  return;
                }

                double newSalary = double.tryParse(salaryCtrl.text) ?? 0.0;
                if (newSalary <= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Invalid salary')),
                  );
                  return;
                }

                Map<String, dynamic> updatedUser = {
                  DBHelper.columnName: nameCtrl.text,
                  DBHelper.columnSex: selectedSex,
                  DBHelper.columnSalary: newSalary,
                };

                await DBHelper.updateUser(id, updatedUser);
                Navigator.pop(context);
                _loadUsers();
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteUser(int id) async {
    await DBHelper.deleteUser(id);
    _loadUsers();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('User deleted')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Management'),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            tooltip: 'All Users',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SummaryPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _idController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'User ID'),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                SizedBox(height: 10),

                // Radio Button สำหรับ Sex (หน้าหลัก)
                Row(
                  children: [
                    SizedBox(width: 12), // ปรับระยะห่างจากขอบ (optional)
                    Text('Sex:', style: TextStyle(fontSize: 16)),
                    SizedBox(width: 24),
                    Row(
                      children: [
                        Radio(
                          value: 'Male',
                          groupValue: _sex,
                          onChanged: (value) {
                            setState(() {
                              _sex = value!;
                            });
                          },
                        ),
                        Text('Male'),
                      ],
                    ),
                    SizedBox(width: 24),
                    Row(
                      children: [
                        Radio(
                          value: 'Female',
                          groupValue: _sex,
                          onChanged: (value) {
                            setState(() {
                              _sex = value!;
                            });
                          },
                        ),
                        Text('Female'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _salaryController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Salary'),
                ),
                SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: _addUser,
                  icon: Icon(Icons.add),
                  label: Text('Add User'),
                ),
              ],
            ),
          ),
          Expanded(
            child: _users.isEmpty
                ? Center(child: Text('No users found'))
                : ListView.builder(
                    itemCount: _users.length,
                    itemBuilder: (context, index) {
                      var user = _users[index];
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: ListTile(
                          leading: CircleAvatar(child: Text('${user['id']}')),
                          title: Text(user['name']),
                          subtitle: Text('${user['sex']} - \$${user['salary']}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit, color: Colors.blue),
                                onPressed: () => _editUserDialog(
                                  user['id'],
                                  user['name'],
                                  user['sex'],
                                  user['salary'],
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _deleteUser(user['id']),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}