// ภูวกร รุ่งปิติศุภากร 1155
import 'package:flutter/material.dart';
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
  List<Map<String, dynamic>> _todos = [];
  Color _backgroundColor = Colors.white;

  void _addTodo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newTodo = "";
        String newSubtitle = "";
        return AlertDialog(
          title: Text("Add a new your lists To-Do"),
          backgroundColor: Color(0xFFFBFBF8),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  newTodo = value;
                },
                decoration: InputDecoration(hintText: "Enter your task"),
              ),
              SizedBox(height: 8),
              TextField(
                onChanged: (value) {
                  newSubtitle = value;
                },
                decoration: InputDecoration(hintText: "Enter details (optional)"),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (newTodo.isNotEmpty) {
                    _todos.add({
                      'text': newTodo,
                      'subtitle': newSubtitle,
                      'editedTimestamp': null,
                    });
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
        String editedTitle = _todos[index]['text'];
        String editedSubtitle = _todos[index]['subtitle'];

        return AlertDialog(
          title: Text("Edit your list"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  editedTitle = value;
                },
                controller: TextEditingController(text: _todos[index]['text']),
                decoration: InputDecoration(hintText: "Edit your task"),
              ),
              SizedBox(height: 8),
              TextField(
                onChanged: (value) {
                  editedSubtitle = value;
                },
                controller: TextEditingController(text: _todos[index]['subtitle']),
                decoration: InputDecoration(hintText: "Edit details (optional)"),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _todos[index]['text'] = editedTitle;
                  _todos[index]['subtitle'] = editedSubtitle;
                  _todos[index]['editedTimestamp'] =
                      DateTime.now().toString(); // บันทึกเวลาแก้ไข
                });
                Navigator.pop(context);
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
              FilteringTextInputFormatter.allow(RegExp(r'^#([A-Fa-f0-9]{0,6})$')),
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
                    SnackBar(content: Text("HEX color must have 6 characters after '#'")),
                  );
                } else {
                  try {
                    setState(() {
                      _backgroundColor =
                          Color(int.parse("0xFF" + hexColor.substring(1)));
                    });
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
        backgroundColor: Color(0xFFF3D082),
        actions: [
          IconButton(
            icon: Icon(Icons.color_lens, color: Color(0xFF3C204B) , size: 30),
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
              tileColor: Color(0xFFFCFAF4),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo['text'],
                    style: TextStyle(fontSize: 18, color: Color(0xFF100818)),
                  ),
                  if (todo['subtitle'] != null && todo['subtitle']!.isNotEmpty)
                    Text(
                      todo['subtitle'],
                      style: TextStyle(fontSize: 14, color: Color(0xFF6B6B6B)),
                    ),
                  if (todo['editedTimestamp'] != null)
                    SizedBox(height: 8),
                  if (todo['editedTimestamp'] != null)
                    Text(
                      'Edited: ${todo['editedTimestamp']}',
                      style: TextStyle(fontSize: 12, color: Color(0xFFCC9900)),
                    ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Color(0xFFf1c407) , size: 30 ),
                    onPressed: () {
                      _editTodo(index);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Color(0xFFfc0404) , size: 30 ),
                    onPressed: () {
                      setState(() {
                        _todos.removeAt(index);
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      //https://m2.material.io/components/buttons-floating-action-button#behavior
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        backgroundColor: Color(0xFFB3DDD5),
        child: Icon(Icons.add ,color: Color(0xFF141005) , size: 30),
      ),
    );
  }
}
