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
      body: ListView(
    
        children: [
          // Friend 1: Sofia Falcone
          ListTile(
            leading: Icon(Icons.person, color: Color(0xFFf4775c), size: 39), // Leading icon
            title: Text(
              'Sofia Falcone',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'ชื่อเล่น: Sofia',
              style: TextStyle(fontSize: 18),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFF31515f)),
            onTap: () {
              // Show dialog on tap
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Color(0xFFfcfdf9), // Dialog background color
                    title: Text('ข้อมูลเพิ่มเติม'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'ส่วนสูง: 172 ซม.',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'น้ำหนัก: 58 กก.',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'สิ่งที่ชอบ: กินอาหารอิตาเลี่ยน.',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'ปิด',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
           //ขึ้นใหม่  //https://www.boltuix.com/2023/05/adding-icons-to-your-flutter.html
          // Friend 2: Alberto Falcone
          ListTile(
            leading: Icon(Icons.person, color: Color(0xFFf4775c), size: 39), 
            title: Text(
              'Alberto Falcone',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'ชื่อเล่น: Alberto',
              style: TextStyle(fontSize: 18),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFF31515f)),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Color(0xFFfcfdf9), 
                    title: Text('ข้อมูลเพิ่มเติม'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'ส่วนสูง: 172 ซม.',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'น้ำหนัก: 68 กก.',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'สิ่งที่ชอบ: ปาร์ตี้.',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'ปิด',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
         //ขึ้นใหม่ 
            // Friend 3: Carmine Falcone
          ListTile(
            leading: Icon(Icons.person, color: Color(0xFFf4775c), size: 39), 
            title: Text(
              'Carmine Falcone',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'ชื่อเล่น: Roman',
              style: TextStyle(fontSize: 18),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFF31515f)),
            onTap: () {
                        showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Color(0xFFfcfdf9), 
                    title: Text('ข้อมูลเพิ่มเติม'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'ส่วนสูง: 177 ซม.',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'น้ำหนัก: 83 กก.',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'สิ่งที่ชอบ: เล่นสนุกเกอร์.',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'ปิด',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
            //ขึ้นใหม่ 
           // Friend 4: Mario Falcone
          ListTile(
            leading: Icon(Icons.person, color: Color(0xFFf4775c), size: 39), 
            title: Text(
              'Mario Falcone',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'ชื่อเล่น: Mario',
              style: TextStyle(fontSize: 18),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFF31515f)),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Color(0xFFfcfdf9), 
                    title: Text('ข้อมูลเพิ่มเติม'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'ส่วนสูง: 188 ซม.',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'น้ำหนัก: 93 กก.',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'สิ่งที่ชอบ: ซื้อเสื้อผ้า.',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'ปิด',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
             //ขึ้นใหม่ 
           // Friend 5: Luca Falcone
          ListTile(
            leading: Icon(Icons.person, color: Color(0xFFf4775c), size: 39), 
            title: Text(
              'Luca Falcone',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'ชื่อเล่น: Luca',
              style: TextStyle(fontSize: 18),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFF31515f)),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Color(0xFFfcfdf9), 
                    title: Text('ข้อมูลเพิ่มเติม'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'ส่วนสูง: 182 ซม.',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'น้ำหนัก: 82 กก.',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'สิ่งที่ชอบ: งานสังสรรค์.',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'ปิด',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
         //? 
        ],
      ),
    );
  }
}