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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 40,
                  width: 100,
                  color: Colors.blue,
                  child: Center(child: Text("FLIPKART",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                ),
              ),
              Spacer(),
              Image.asset("assets/images/logo.jpeg",height: 50,
              width: 50,),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                   height: 40,
                    width: 100,
                    color: Colors.blue,
                    child: Center(child:Icon(Icons.local_grocery_store),
                    
                    
                     
                     ),
                ),
              ),
              
              
          ],
          ),
          SizedBox(height: 5,),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                
                decoration: BoxDecoration(border: Border.all(color: Colors.black,),color: Colors.white,borderRadius: BorderRadius.circular(26,)),
                height: 50,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.search,size: 25,color: Colors.blue,),
                      Text("Search Phones...............",style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold),),
                      Spacer(),
                      Icon(Icons.mic,color: Colors.blue,size: 25,),
                      Icon(Icons.camera,size: 25,color: Colors.red,)
                    ],
                  ),
                )
              ),
            ),
          ),
          SizedBox(height: 1,),
          Column(
            children: [
              CarouselSlider( options: CarouselOptions(
                height: 100,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16/9,
                autoPlayCurve: Curves.easeInOutCubicEmphasized,enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8
              ),
              items: 
                imageUrl.map((imageUrl){
                  return Container(
                    height: 400,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Image.asset(imageUrl,fit: BoxFit.cover,),
                  );
                }).toList()
                
              
              )
              
            ],
          ),
          SizedBox(height: 5,),
          Expanded(
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisSpacing: 5,
              
              crossAxisCount: 2),
              itemCount: 4,
               itemBuilder: (BuildContext context,int index){
                return Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.white70),
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.all(15), 
                height: 200,
                width: 200,
                
                 child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>DescriptionScreenExp(imagePath: Database.phoneList[index]["image"], name: Database.phoneList[index]["name"], price: Database.phoneList[index]["price"], description: Database.phoneList[index]["des"])));
                      },
                    ),
                    Image.asset(Database.phoneList[index]["image"],height: 80,width: 150,),
                     Text(Database.phoneList[index]["name"],style: TextStyle(fontSize: 15),),
                    Expanded(
                      child: Center(
                        child: Row(
                        
                          children: [
                             Icon(Icons.currency_rupee,size: 17,),
                             Spacer(),
                             
                                       
                        Text(Database.phoneList[index]["price"],style: TextStyle(fontSize: 15),),
                        Spacer(),
                        Text(Database.phoneList[index]["buy"],style: TextStyle(color: Colors.red,fontWeight:FontWeight.bold,fontSize: 17),),
                             
                          ],
                        ),
                      ),
                    )
                  
                  ],
                 )
                 
                );
               }),
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