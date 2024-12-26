// ภูวกร รุ่งปิติศุภากร 1155
import 'package:flutter/material.dart';
import 'dart:math'; // ใช้สำหรับสุ่มตัวเลข

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RandomNumberGame(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RandomNumberGame extends StatefulWidget {
  @override
  _RandomNumberGameState createState() => _RandomNumberGameState();
}

class _RandomNumberGameState extends State<RandomNumberGame> {
  final TextEditingController _controller = TextEditingController();
  int? _randomNumber;
  String _message = "";

  @override
  void initState() {
    super.initState();
    _generateRandomNumber();
  }

  void _generateRandomNumber() {
    _randomNumber = Random().nextInt(100) + 1; // สุ่มเลขระหว่าง 1 ถึง 100
  }

  void _checkAnswer() {
    final int? userInput = int.tryParse(_controller.text);
    if (userInput == null) {
      setState(() {
        _message = "กรุณากรอกตัวเลข!";
      });
      return;
    }

    if (userInput == _randomNumber) {
      setState(() {
        _message = "โอ้สุดยอด! คุณเดาถูกแล้ว 🎉";
      });
    } else {
      setState(() {
        _message = "อ๋อ🤭 คุณเดาผิด! คำตอบที่ถูกคือ $_randomNumber";
      });
    }
  }

  void _resetGame() {
    _controller.clear();
    _generateRandomNumber();
    setState(() {
      _message = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "เกมทายตัวเลข 1 ถึง 100",
          style: TextStyle(color: Color(0xFFFEFEFE)), // สีข้อความเป็นขาว
        ),
        backgroundColor: Color(0xFF0096F7), // สีฟ้า
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "เดาตัวเลข (1-100)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "กรอกตัวเลขที่คุณเดาดูสิ",
              ),
            ),
            SizedBox(height: 20),
            Text(
              _message,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 20),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    ElevatedButton(
      onPressed: _resetGame,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF1D88FB), // สีน้ำเงิน
      ),
      child: Text(
        "เริ่มใหม่",
        style: TextStyle(color: Color(0xFFFEFEFE)), // สีข้อความเป็นขาว
      ),
    ),
    SizedBox(width: 10),
    ElevatedButton(
      onPressed: _checkAnswer,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFFE1C1B), // สีแดง
      ),
      child: Text(
        "ส่งคำตอบ",
        style: TextStyle(color: Color(0xFFFEFEFE)), // สีข้อความเป็นขาว
      ),
    ),
  ],
),
]
        ),
      ),
    );
  }
}