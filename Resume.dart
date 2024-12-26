// ภูวกร รุ่งปิติศุภากร 1155
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'แนะนำตัว',
            style: TextStyle(color: Color(0xFF16130C)),
          ),
          backgroundColor: Color(0xFFA3A5A2), // AppBar background color
        ),
        body: Container(
          color: Color(0xFFF9F9F9), // Screen background color
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image
                Image.network(
                  'https://scontent.fbkk5-7.fna.fbcdn.net/v/t39.30808-6/471624507_475505012233251_2175428263145955386_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeE3oqUeiw0l17leW1H1_s-we7Gvw10Eu4x7sa_DXQS7jOfv0HPLEAVb_Q1WOWAslytHYe6OCHeXdXKg08rzmtyD&_nc_ohc=SJ3szj6Wds0Q7kNvgGUJVgB&_nc_oc=Adiqnh-pNNeuTcvZTTjvMuQF5-dbuD4Mw2PuR6SUgCk3UIS1n77MMcz3fYS7BKbe_6k&_nc_zt=23&_nc_ht=scontent.fbkk5-7.fna&_nc_gid=ALoe433rRkHkbR-CAFtNW9j&oh=00_AYDXG5HIEmHOLZu514COd5u611jV2x5vPyuXWCpp0eXawA&oe=677300CB',
                  height: 200,
                  width: 600,
                ),
                SizedBox(height: 20),
                // Description
                Text(
                  'Profile',
                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 26, color: Colors.black),
                 ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(20),
                  color: Colors.grey[100],
                  child: Text(
                    'Name: Phuvakorn\n'
                    'Lastname: Rungpitisupakorn\n'
          'Nickname: Focus',
                                  textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Color(0xFF16130C)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(10),
                  color: Colors.grey[100],
                  child: Text(
                  
'Gender: Male\n'
'Age: 20\n'
'Date of Birth: 8th March 2004\n'
'Nation: Thai\n'
'Race: Thai\n'
'Religion: Buddhism',
                                  textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Color(0xFF16130C)),
                  ),
                ),

                SizedBox(height: 12),
                // Additional information
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xFFFA2334)), // Red border
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20), // Space
                      // Stars Rating Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                color: Color(0xFFFFCC33),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "170 Reviews",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      // Education section
                      
                                      SizedBox(height: 20),
                // Description
                Text(
                  'Education',
                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 26, color: Colors.black),
                 ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // PREP
                          Column(
                            children: [
                              Icon(Icons.kitchen, color: Color(0xFF29CFC5)),
                              SizedBox(height: 5),
                              Text(
                                'PREP:',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '25 min',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          // COOK
                          Column(
                            children: [
                              Icon(Icons.timer, color: Color(0xFF29CFC5)),
                              SizedBox(height: 5),
                              Text(
                                'COOK:',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '1 hr',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          // FEEDS
                          Column(
                            children: [
                              Icon(Icons.restaurant, color: Color(0xFF29CFC5)),
                              SizedBox(height: 5),
                              Text(
                                'FEEDS:',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '4-6',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                      
                      SizedBox(height: 20),
                      // About me
                      
                       Text(
                  'About me:',
                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 26, color: Colors.black),
                 ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // PREP
                          Column(
                            children: [
                              Icon(Icons.kitchen, color: Color(0xFF29CFC5)),
                              SizedBox(height: 5),
                              Text(
                                'PREP:',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '25 min',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          // COOK
                          Column(
                            children: [
                              Icon(Icons.timer, color: Color(0xFF29CFC5)),
                              SizedBox(height: 5),
                              Text(
                                'COOK:',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '1 hr',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          // FEEDS
                          Column(
                            children: [
                              Icon(Icons.restaurant, color: Color(0xFF29CFC5)),
                              SizedBox(height: 5),
                              Text(
                                'FEEDS:',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '4-6',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}