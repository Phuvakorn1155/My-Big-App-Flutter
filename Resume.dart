// ภูวกร รุ่งปิติศุภากร 1155
import 'package:flutter/material.dart';

class Resume extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'แนะนำตัว',
            style: TextStyle(color: Color(0xFF2e4c58)),
          ),
          backgroundColor: Color(0xFFfffece), // AppBar background color
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color: Color(0xFF311E1B)), // Custom back button color
            onPressed: () {
              Navigator.pop(context); // Navigate back to homepage
            },
          ),
        ),
        body: Container(
          color: Color(0xFFF9F9F9), // Screen background color
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 5),
                // Image
                Image.network(
                  'https://scontent.fbkk5-7.fna.fbcdn.net/v/t39.30808-6/471624507_475505012233251_2175428263145955386_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeE3oqUeiw0l17leW1H1_s-we7Gvw10Eu4x7sa_DXQS7jOfv0HPLEAVb_Q1WOWAslytHYe6OCHeXdXKg08rzmtyD&_nc_ohc=SJ3szj6Wds0Q7kNvgGUJVgB&_nc_oc=Adiqnh-pNNeuTcvZTTjvMuQF5-dbuD4Mw2PuR6SUgCk3UIS1n77MMcz3fYS7BKbe_6k&_nc_zt=23&_nc_ht=scontent.fbkk5-7.fna&_nc_gid=ALoe433rRkHkbR-CAFtNW9j&oh=00_AYDXG5HIEmHOLZu514COd5u611jV2x5vPyuXWCpp0eXawA&oe=677300CB',
                  height: 320,
                  width: 300,
                ),
                SizedBox(height: 5),
                // Description
                Text(
                  'โปรไฟล์',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(10),
                  color: Colors.grey[100],
                  child: Text(
                    'ชื่อ : ภูวกร\n'
                    'นามสกุล : รุ่งปิติศุภากร\n'
                    'ชื่อเล่น : โฟกัส\n'
                    'เพศ: ชาย\n'
                    'อายุ: 20\n'
                    'วันเกิด: 8 มีนาคม 2547\n'
                    'สัญชาติ: ไทย\n'
                    'เชื้อชาติ: ไทย\n'
                    'ศาสนา: พุทธศาสนา',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Color(0xFF16130C)),
                  ),
                ),
                Text(
                  'ประวัติการศึกษา',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(10),
                  color: Colors.grey[100],
                  child: Text(
                    'ปริญญาตรี:\n'
                    'มหาวิทยาลัยเทคโนโลยีราชมงคลรัตนโกสินทร์\nวิทยาเขตบพิตรพิมุขจักรวรรดิ\nคณะบริหารธุรกิจ\nสาขาวิชาเทคโนโลยีสารสนเทศทางธุรกิจ 2565 - 2568\n'
                    'ปวช:\n'
                    'วิทยาลัยพณิชยการธนบุรี\nแผนกภาษาต่างประเทศ 2562 - 2565\n'
                    'มัธยมต้น:\n'
                    'โรงเรียนไตรมิตรวิทยาลัย 2559 – 2562',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 15, color: Color(0xFF16130C)),
                  ),
                ),
                Text(
                  'ทักษะความสามารถ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(10),
                  color: Colors.grey[100],
                  child: Text(
                    'การเขียนโปรแกรม/เขียนเว็บไซต์ html\n'
                    'ทักษะด้านภาษา\n'
                    'คอมพิวเตอร์เบื้องต้น\n'
                    'การถ่ายภาพ',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 15, color: Color(0xFF16130C)),
                  ),
                ),
                Text(
                  'ที่อยู่ติดต่อ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(10),
                  color: Colors.grey[100],
                  child: Text(
                    'ที่อยู่:\n'
                    '365/3-4 ถนนประชาธิปก\nตำบลสมเด็จเจ้าพระยา อำเภอคลองสาน\nกรุงเทพมหานคร 10600',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 15, color: Color(0xFF16130C)),
                  ),
                ),
                Text(
                  'ช่องทางการติดต่อ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(10),
                  color: Colors.grey[100],
                  child: Text(
                    'ติดต่อ:\n'
                    'อีเมล: 3651051541155@rmutr.ac.th\n'
                    'โซเชียลมีเดีย:ทวิตเตอร์(X) @Phuvakorn_Focus \n'
                    'เบอร์โทรศัพท์: 099 843 8560 \n',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 15, color: Color(0xFF16130C)),
                  ),
                ),

                //SizedBox(height: 12),
                // Additional information
                // Container(
                //  padding: EdgeInsets.all(10),
                //  decoration: BoxDecoration(
                //    color: Colors.white,
                //    border: Border.all(color: Color(0xFFFA2334)), // Red border
                //    borderRadius: BorderRadius.circular(10),
                //   ),
                //         child: Column(
                //           children: [
                // Space
                // Stars Rating Section
                //         Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //       Text(
                //       'About me:',
                //     textAlign: TextAlign.center,
                //   style: TextStyle(fontSize: 20, color: Colors.black),
                // ),
                // ],
                // ),
                // Description
                // About me
              ],
            ),
          ),
        ),
      ),
    );
  }
}
