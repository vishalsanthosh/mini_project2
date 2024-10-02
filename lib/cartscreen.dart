import 'package:flutter/material.dart';

class CartScreenExp extends StatelessWidget {
  final String imagePath;
final String name;
final String price;
CartScreenExp({required this.imagePath,required this.name,required this.price});

  @override
  Widget build(BuildContext context ) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(title: Text("MY CART",style: TextStyle(color: Colors.black),),),
body: Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(5)),
    height:100,
    width: double.infinity,
    child: Column(
      children: [
        Center(
          child: Row(
            children: [
              Image.asset(imagePath,height: 95,width: 100,),
              SizedBox(width: 5,),
              Text(name,style: TextStyle(fontSize: 20,color:Colors.blue),),
              SizedBox(width: 5,),
              Text(price,style: TextStyle(fontSize: 15,color: Colors.red),)
            ],
          ),
        )
      ],
    ),
  ),
),
floatingActionButton: FloatingActionButton

(onPressed: (){},child: Text("BUY",style: TextStyle(color: Colors.red[500],fontWeight: FontWeight.bold),),),
    );
    
  }
}