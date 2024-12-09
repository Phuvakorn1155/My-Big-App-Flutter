import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Map<String, dynamic>> _todos = []; // แก้ไขโครงสร้างข้อมูล
  Color _backgroundColor = Colors.white;
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      final String? todosString = _prefs.getString('todos');
      if (todosString != null) {
        _todos = List<Map<String, dynamic>>.from(jsonDecode(todosString));
      } else {
        _todos = [];
      }
      _backgroundColor =
          Color(_prefs.getInt('backgroundColor') ?? Colors.white.value);
    });
  }

  Future<void> _saveData() async {
    await _prefs.setString('todos', jsonEncode(_todos)); // บันทึกในรูปแบบ JSON
    await _prefs.setInt('backgroundColor', _backgroundColor.value);
  }

  void _addTodo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newTodo = "";
        return AlertDialog(
          title: Text("Add a your new list"),
          content: TextField(
            onChanged: (value) {
              newTodo = value;
            },
            decoration: InputDecoration(hintText: "Enter your task"),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (newTodo.isNotEmpty) {
                    _todos.add({
                      'text': newTodo,
                      'timestamp': DateTime.now().toString(),
                      'editedTimestamp': null,
                    });
                    _saveData();
                  }
                  Navigator.pop(context);
                });
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void _editTodo(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String editedTodo = _todos[index]['text'];
        return AlertDialog(
          title: Text("Edit your list"),
          content: TextField(
            onChanged: (value) {
              editedTodo = value;
            },
            controller: TextEditingController(text: _todos[index]['text']),
            decoration: InputDecoration(hintText: "Edit your task"),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _todos[index]['text'] = editedTodo;
                  _todos[index]['editedTimestamp'] =
                      DateTime.now().toString(); // บันทึกเวลาแก้ไข
                  _saveData();
                  Navigator.pop(context);
                });
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void _changeBackgroundColor() {
    TextEditingController colorController =
        TextEditingController(text: _backgroundColorToHex(_backgroundColor));

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Change Background Color"),
          content: TextField(
            controller: colorController,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(r'^#([A-Fa-f0-9]{0,6})$')),
            ],
            decoration: InputDecoration(
              hintText: "Enter HEX color (e.g., #FFFFFF)",
            ),
            onChanged: (value) {
              if (!value.startsWith('#')) {
                colorController.text = '#';
                colorController.selection = TextSelection.fromPosition(
                    TextPosition(offset: colorController.text.length));
              }
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                String hexColor = colorController.text;
                if (hexColor.length != 7) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:
                            Text("HEX color must have 6 characters after '#'")),
                  );
                } else {
                  try {
                    setState(() {
                      _backgroundColor =
                          Color(int.parse("0xFF" + hexColor.substring(1)));
                    });
                    _saveData();
                    Navigator.pop(context);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Invalid HEX color format")),
                    );
                  }
                }
              },
              child: Text("Change"),
            ),
          ],
        );
      },
    );
  }

  String _backgroundColorToHex(Color color) {
    return '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Make a your lists"),
        backgroundColor: Color(0xFFFCCF68),
        actions: [
          IconButton(
            icon: Icon(Icons.color_lens),
            onPressed: _changeBackgroundColor,
          ),
        ],
      ),
      backgroundColor: _backgroundColor,
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          final todo = _todos[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              tileColor: Color(0xFFFCFAF4), // สีพื้นหลังของข้อความ
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ข้อความหลัก
                  Text(
                    todo['text'],
                    style: TextStyle(
                      fontSize: 29,
                      color: Color(0xFF100818),
                    ),
                  ),
                  SizedBox(height: 8), // ระยะห่างระหว่างข้อความและเวลา

                  // วันเวลาของโพสต์
                  Text(
                    'Posted: ${todo['timestamp']}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF003442), // สีสำหรับวันเวลาโพสต์
                    ),
                  ),

                  // วันเวลาที่แก้ไข (ถ้ามี)
                  if (todo['editedTimestamp'] != null) ...[
                    SizedBox(height: 4), // ระยะห่างระหว่างวันเวลาโพสต์และแก้ไข
                    Text(
                      'Edited: ${todo['editedTimestamp']}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFFCC9900), // สีสำหรับวันเวลาแก้ไข
                      ),
                    ),
                  ],
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Color(0xFFf1c407)),
                    onPressed: () {
                      _editTodo(index);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Color(0xFFfc0404)),
                    onPressed: () {
                      setState(() {
                        _todos.removeAt(index);
                        _saveData();
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        backgroundColor: Color(0xFF67BBAA),
        child: Icon(Icons.add),
      ),
    );
  }
}


//เพิ่มรายการใหม่ → กด +
//แก้ไขรายการ → กดไอคอนดินสอ
//ลบรายการ → กดไอคอนถังขยะ
//เปลี่ยนสีพื้นหลัง → กดไอคอนพู่กันบน AppBar
