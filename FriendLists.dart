import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FriendListScreen(),
    );
  }
}

class FriendListScreen extends StatelessWidget {
  final List<Map<String, String>> friends = [
    {
      'name': 'Sofia Falcone',
      'nickname': 'Sofia',
      'height': '172 ซม.',
      'weight': '58 กก.',
      'likes': 'กินอาหารอิตาเลี่ยน',
    },
    {
      'name': 'Alberto Falcone',
      'nickname': 'Alberto',
      'height': '172 ซม.',
      'weight': '68 กก.',
      'likes': 'ปาร์ตี้',
    },
    {
      'name': 'Carmine Falcone',
      'nickname': 'Roman',
      'height': '177 ซม.',
      'weight': '83 กก.',
      'likes': 'เล่นสนุกเกอร์',
    },
    {
      'name': 'Mario Falcone',
      'nickname': 'Mario',
      'height': '188 ซม.',
      'weight': '93 กก.',
      'likes': 'ซื้อเสื้อผ้า',
    },
    {
      'name': 'Luca Falcone',
      'nickname': 'Luca',
      'height': '182 ซม.',
      'weight': '82 กก.',
      'likes': 'งานสังสรรค์',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'แสดงรายชื่อเพื่อนสนิท',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF2e4c58),
      ),
      backgroundColor: Color(0xFFfefefd),
      body: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (context, index) {
          final friend = friends[index];
          return ListTile(
            leading: Icon(Icons.person, color: Color(0xFFf4775c), size: 39),
            title: Text(
              friend['name']!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'ชื่อเล่น: ${friend['nickname']}',
              style: TextStyle(fontSize: 18),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFF31515f)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FriendDetailScreen(
                    name: friend['name']!,
                    nickname: friend['nickname']!,
                    height: friend['height']!,
                    weight: friend['weight']!,
                    likes: friend['likes']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
class FriendDetailScreen extends StatelessWidget {
  final String name;
  final String nickname;
  final String height;
  final String weight;
  final String likes;

  FriendDetailScreen({
    required this.name,
    required this.nickname,
    required this.height,
    required this.weight,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: TextStyle(color: Color(0xFF2e4c58)), // Text color
        ),
        backgroundColor: Color(0xFFFDFDFC),
      ),
      backgroundColor: Color(0xFFfcfdf9), // Background color
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ชื่อ: $name',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'ชื่อเล่น: $nickname',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'ส่วนสูง: $height',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'น้ำหนัก: $weight',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'สิ่งที่ชอบ: $likes',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}