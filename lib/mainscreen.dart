import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mini_project2/database.dart';
import 'package:mini_project2/descriptionscreen.dart';

class Mainscreen extends StatelessWidget {
  final List<String> imageUrl=[

    "assets/images/offer1.png",
    "assets/images/ph2.jpeg",
    "assets/images/ph3.jpeg",
    "assets/images/ph4.jpeg",
    "assets/images/phn1.jpeg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 11, 105, 212),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 45,
                      width: 250,
                      
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,),
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Row(
                        children: [
                          Icon(Icons.search,color: Colors.grey),
                           Text("Flipkart",style: TextStyle(color: Colors.blue),),
                           Spacer(),
                           Image.asset("assets/images/logo.jpeg",height: 100,width: 60,)
                        ],
                       ),
                     ),
                      ),
                  ],
                ),
                Spacer(),
                Icon(Icons.favorite,color: Colors.red,size: 30,),
                Spacer(),
                Icon(Icons.shopping_cart,color: const Color.fromARGB(255, 1, 12, 41),size: 30,),
            
              ]
                  ),
          ),
           
           SizedBox(height: 10,),
          CarouselSlider( options: CarouselOptions(
            height: 200,
            aspectRatio: 9/16,
            autoPlay: true,
            enlargeCenterPage: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
      
          items: imageUrl.map((imageUrl){
       return Container(
          height: 200,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 0.5),
          decoration: BoxDecoration(
            color: Colors.yellow,
          ),
          child: Image.asset(imageUrl,
          fit: BoxFit.cover,),
        );
      
          }).toList(),
          ),
      
        SizedBox(height: 10),
      
                
         
       
      SizedBox(height: 15),
      Expanded(
        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 9/9,
          crossAxisCount: 2), 
          itemCount: 4,
          itemBuilder: (context,index){
          return Container(
          height: 500,
          width: 500,
          decoration: BoxDecoration(border: Border.all(color: const Color.fromARGB(255, 204, 203, 203)),color: Colors.white),
           child:Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DescriptionScreenExp(imagePath: Database.phoneList[index]["image"],
                  name:Database.phoneList[index]["name"],
                  price:Database.phoneList[index]["price"],
                  description: Database.phoneList[index]["des"],
                  )));
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(Database.phoneList[index]["image"])),
                    
                 ),
                 height: 115,
                 width: double.infinity,
                ),
              ),
              SizedBox(height: 10,),
               Center(child: Text(Database.phoneList[index]["name"],style: TextStyle(fontSize: 14,color: Colors.blue[600],fontWeight: FontWeight.w800),)),

               
            Container(
              height: 20,
              width: 130,
              child: Center(child: Text("Flipkart Assured",style: TextStyle(fontSize: 13),)),
              color: const Color.fromARGB(255, 4, 145, 226),
             ),


               Row(
                    children: [
                      Icon(Icons.currency_rupee,size: 14,),
                      Center(child: Text(Database.phoneList[index]["price"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),)),
                      
                    
                    
                    ],
                  ),
                



             ],
           ),
                         );
      }
        ),
      ),
      ]),
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
      );}}