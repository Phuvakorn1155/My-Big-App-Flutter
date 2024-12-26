// ภูวกร รุ่งปิติศุภากร 1155
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'product_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/productDetail': (context) => ProductDetailPage(),
      },
    );
  }
}
