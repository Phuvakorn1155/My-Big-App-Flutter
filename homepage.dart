// ภูวกร รุ่งปิติศุภากร 1155
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'title': 'Item 1',
      'price': '\$155',
      'image': 'https://i.ebayimg.com/images/g/XNQAAOSwpdZnT1jj/s-l1600.jpg',
      'detail': 'Tommy Bahama Mens Silk Tie Yellow With Pineapple.'
    },
    {
      'title': 'Item 2',
      'price': '\$157',
      'image': 'https://i.ebayimg.com/images/g/XYoAAOSwVzdnQQ89/s-l1600.jpg',
      'detail':
          'St. Michael Marks Spencer Silk Tie Pineapple Yellow Sky Blue Orange Detail 4”.'
    },
    {
      'title': 'Item 3',
      'price': '\$76',
      'image': 'https://i.ebayimg.com/images/g/VekAAOSwPHJma4ep/s-l1600.jpg',
      'detail':
          'Men’s Brooks Brothers Makers 100% Silk Yellow Tie W/Pineapples.'
    },
    {
      'title': 'Item 4',
      'price': '\$67',
      'image': 'https://i.ebayimg.com/images/g/jjIAAOSwn9hmn~sD/s-l1600.jpg',
      'detail':
          'Salvatore Ferragamo Men\'s Silk Tie Yellow Pineapple Print Made In Italy.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5EBD6),
      appBar: AppBar(
        backgroundColor: Color(0xFFFEEEBd),
        title: Text(
          'Product List',
          style: TextStyle(color: Color(0xFF080004)),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 7,
            mainAxisSpacing: 7,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/productDetail',
                  arguments: products[index],
                );
              },
              child: Container(
                color: Color(0xFFFCF8F3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.network(
                        products[index]['image']!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            products[index]['title']!,
                            style: TextStyle(
                              color: Color(0xFF191919),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            products[index]['price']!,
                            style: TextStyle(
                              color: Color(0xFF313131),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(
                        Icons.zoom_in,
                        color: Color(0xFF16130C),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
