import 'package:flutter/material.dart';
import 'package:mini_project2/cartscreen.dart';
import 'package:mini_project2/database.dart';

class DescriptionScreenExp extends StatelessWidget {
final String imagePath;
final String name;
final String price;
final String description;
DescriptionScreenExp({required this.imagePath,required this.name,required this.price,required this.description});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Stack(
              children: [
                Container(
                  height: 310,
                  width: double.infinity,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage(imagePath),
                  fit: BoxFit.cover)
                  
                  ),
                  
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child:Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,color: Colors.grey
                    ),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);

                      },
                      child: Icon(Icons.arrow_back,color: Colors.white,size: 30,),
                    ),
                  ) )
              ],
            ),
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Text("Flipkart",style: TextStyle(color: Colors.blue),),
              Spacer(),
              Icon(Icons.favorite,color: Colors.blue,)
            ],
          ),
          Row(
            children: [
              Text(name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              SizedBox(width: 20,),
              
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(description,maxLines: 2,overflow: TextOverflow.ellipsis,),
          SizedBox(height: 15,),
          Center(child: Text("Choose Storage")),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                  color: Colors.white
                  ),
                  child: Center(child: Text("128GB")),
                ),
                SizedBox(width: 15,),
                Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white),
                  child: Center(child: Text("256GB")),
                ),
                 SizedBox(width: 15,),
                Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white),
                  child: Center(child: Text("526GB")),
                )
              ],
              
            ),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container( 
                  height: 60,
                  width: 100,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.blue[200]),
                  child: Row(
                    children: [
                      Icon(Icons.currency_rupee,color: Colors.red,),
                      Text(price,style: TextStyle(fontSize: 15),)
                    ],
                  )
                ),
               
                Spacer(),
                Container(
                  height: 70,
                  width: 140,
                  decoration: BoxDecoration(border:Border.all(color: Colors.black),color: Colors.white),
                  child: ElevatedButton(onPressed:
                  
                   (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreenExp(imagePath: imagePath, name: name, price: price))); 
                  }, child: Text("ADD TO CART")),
                )
              ],
            ),
          )
          
        ],

      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"
          ),
           BottomNavigationBarItem(icon: Icon(Icons.directions),label: "Explore"
          ),
           BottomNavigationBarItem(icon: Icon(Icons.category_rounded),label: "Categories"
          ),
           BottomNavigationBarItem(icon: Icon(Icons.person),label: "Account"
          ),
           BottomNavigationBarItem(icon: Icon(Icons.shopping_basket),label: "Cart"
          ),
          
        ]),
    );
    
  }
}