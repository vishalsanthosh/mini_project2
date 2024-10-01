import 'package:flutter/material.dart';

class CartScreenExp extends StatelessWidget {
  final String imagePath;
final String name;
final String price;
CartScreenExp({required this.imagePath,required this.name,required this.price});

  @override
  Widget build(BuildContext context ) {
    return Scaffold(
body: Container(
  height:100,
  width: double.infinity,
  child: Column(
    children: [
      Row(
        children: [
          Image.asset(imagePath),
          Text(name),
          Text(price)
        ],
      )
    ],
  ),
),
    );
  }
}