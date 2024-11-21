import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  List<String> _todos = [];
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
      _todos = _prefs.getStringList('todos') ?? [];
      _backgroundColor = Color(_prefs.getInt('backgroundColor') ?? Colors.white.value);
    });
  }

  Future<void> _saveData() async {
    await _prefs.setStringList('todos', _todos);
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
                    _todos.add(newTodo);
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
        String editedTodo = _todos[index];
        return AlertDialog(
          title: Text("Edit your list"),
          content: TextField(
            onChanged: (value) {
              editedTodo = value;
            },
            controller: TextEditingController(text: _todos[index]),
            decoration: InputDecoration(hintText: "Edit your task"),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _todos[index] = editedTodo;
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
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String hexColor = "";
        return AlertDialog(
          title: Text("Change Background Color"),
          content: TextField(
            onChanged: (value) {
              hexColor = value;
            },
            decoration: InputDecoration(
              hintText: "Enter HEX color (#FFFFFF)",
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                try {
                  setState(() {
                    _backgroundColor = Color(int.parse("0xFF" + hexColor.substring(1)));
                    _saveData();
                  });
                  Navigator.pop(context);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Invalid HEX color format")),
                  );
                }
              },
              child: Text("Change"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Make a your lists"),
               backgroundColor: Color(0xFFEBE2D9),     
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
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(
                _todos[index],
                style: TextStyle(fontSize: 18),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Color(0xFFFEA900),),
                    onPressed: () {
                      _editTodo(index);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Color(0xFFCD2504),),
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
       backgroundColor: Color(0xFF31A39D),
        child: Icon(Icons.add),
      ),
    );
  }
}

//เพิ่มรายการใหม่ → กด +
//แก้ไขรายการ → กดไอคอนดินสอ
//ลบรายการ → กดไอคอนถังขยะ
//เปลี่ยนสีพื้นหลัง → กดไอคอนพู่กันบน AppBar