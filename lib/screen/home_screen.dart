import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:charity_app_ui/widget/explore_causes.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dart:convert';

import 'campaign_page.dart';
import 'detail_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List charity=[];
  List campaign=[];
  _readData() async{
    await DefaultAssetBundle.of(context).loadString("lib/json/charity_program.json").then((value) {
      setState(() {
        charity=json.decode(value);
      });
    });
    await DefaultAssetBundle.of(context).loadString("lib/json/campaign.json").then((value) {
      setState(() {
        campaign=json.decode(value);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _readData();
    super.initState();
  }
  int _selectedIndex=0;

  void changeIndex(int index){
    setState(() {
      _selectedIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedFontSize: 18,
          unselectedFontSize: 18,
          selectedItemColor: Colors.pink,
          iconSize: 28,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: changeIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "Discover",backgroundColor: Colors.white),
            BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border_rounded),label: "Favorite"),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded),label: "My Page"),
          ],
        ),
        floatingActionButton: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300,width: 3)
          ),
          child: FloatingActionButton(
            onPressed: (){},
            backgroundColor: Colors.pinkAccent,
            child: Icon(Icons.add,size: 30,),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Container(
          height: height,
          width: width,
          color: Colors.white,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: height*0.26,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow.withOpacity(0.4)
                  ),
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Hello Tridip",style: GoogleFonts.acme(textStyle: TextStyle(fontSize: 40,fontWeight: FontWeight.w900,color: Colors.pink)),),
                              Text("Dhaka, Bangladesh",style: TextStyle(fontSize: 19,color: Colors.pink,fontWeight: FontWeight.w500),)
                            ],
                          ),
                          Expanded(child: Container()),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(image: AssetImage("lib/images/profile.jpg"),fit: BoxFit.cover)
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 25,),
                      Text("Explore all causes",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800),)
                    ],
                  ),
                ),
              ),
              Positioned(
                top: height*0.195,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              height: 95,
                              width: 110,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade200.withOpacity(0.5),
                                    blurRadius: 10
                                  )
                                ]
                              ),
                              padding: EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Icon(Icons.home_outlined,color: Colors.pinkAccent,size: 35,),
                                  Text("charity",style: TextStyle(fontSize: 17,color: Colors.pinkAccent),)
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                ExploreCauses(icon: Icons.local_fire_department_outlined, text: "disaster"),
                                ExploreCauses(icon: Icons.health_and_safety_outlined, text: "healthcare"),
                                ExploreCauses(icon: Icons.person_outline_rounded, text: "disaster"),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 25,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("They need your help",style: GoogleFonts.acme(textStyle: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.blueGrey)),),
                          IconButton(onPressed: (){
                            Get.to(()=>CampaignPage());
                          }, icon: Icon(Icons.arrow_forward,size: 30,))
                        ],
                      ),
                      SizedBox(height: 10,),
                      //list
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                            itemCount: charity.length,
                            itemBuilder: (_,index){
                          return InkWell(
                            onTap: (){
                              Get.to(()=>Detailpage(),arguments: {
                                'programName':charity[index]['programName'].toString(),
                                'image':charity[index]['image'].toString(),
                                'deadline':charity[index]['left'],
                                'collectedMoney':charity[index]['collectedMoney'],
                                'totalMoney':charity[index]['totalMoney'],
                                'supporters':charity[index]['supporters'],
                                'project':charity[index]['project'],
                                'title':charity[index]['title']
                              });
                            },
                            child: Container(
                              height: 200,
                              width: width*0.85,
                              margin: EdgeInsets.only(right: 10),
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(image: AssetImage(charity[index]['image']),fit: BoxFit.cover,opacity: 0.7)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.5),
                                          shape: BoxShape.circle
                                        ),
                                          padding: EdgeInsets.all(7),
                                          child: Icon(Icons.favorite_rounded,color: Colors.white,size: 28,)),
                                      Expanded(child: Container()),
                                      Container(
                                        padding:EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.pinkAccent,
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Text("2 days left",style: TextStyle(fontSize: 18,color: Colors.grey.shade200),),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(charity[index]['programName'],style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                                      SizedBox(height: 5,),
                                      LinearPercentIndicator(
                                        lineHeight: 08,
                                        percent: charity[index]['percent'],
                                        animation: true,
                                        animationDuration: 100,
                                        progressColor: Colors.yellow,
                                        barRadius: Radius.circular(10),
                                        backgroundColor: Colors.grey,
                                      ),
                                      SizedBox(height: 5,),
                                      Text("\$"+charity[index]['collectedMoney']+" collected",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500, color: Colors.white),)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Campaign to you",style: GoogleFonts.acme(textStyle: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),color: Colors.blueGrey),),
                          IconButton(onPressed: (){
                            Get.to(()=>CampaignPage());
                          }, icon: Icon(Icons.arrow_forward,size: 30,))
                        ],
                      ),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: campaign.length,
                            itemBuilder: (_,index){
                              return InkWell(
                                onTap: (){
                                  Get.to(()=>Detailpage(),arguments: {
                                    'programName':campaign[index]['programName'].toString(),
                                    'image':campaign[index]['image'].toString(),
                                    'deadline':campaign[index]['left'],
                                    'collectedMoney':campaign[index]['collectedMoney'],
                                    'totalMoney':campaign[index]['totalMoney'],
                                    'supporters':campaign[index]['supporters'],
                                    'project':campaign[index]['project'],
                                    'title':campaign[index]['title']
                                  });
                                },
                                child: Container(
                                  height: 200,
                                  width: width*0.85,
                                  margin: EdgeInsets.only(right: 10),
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: Colors.greenAccent,
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(image: AssetImage(campaign[index]['image']),fit: BoxFit.cover)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.withOpacity(0.5),
                                                  shape: BoxShape.circle
                                              ),
                                              padding: EdgeInsets.all(7),
                                              child: Icon(Icons.favorite_rounded,color: Colors.white,size: 28,)),
                                          Expanded(child: Container()),
                                          Container(
                                            padding:EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                            decoration: BoxDecoration(
                                                color: Colors.pinkAccent,
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: Text(campaign[index]['left']+" days left",style: TextStyle(fontSize: 18,color: Colors.grey.shade200),),
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(campaign[index]['programName'],style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                                          SizedBox(height: 5,),
                                          LinearPercentIndicator(
                                            lineHeight: 08,
                                            percent: campaign[index]['percent'],
                                            animation: true,
                                            animationDuration: 100,
                                            progressColor: Colors.yellow,
                                            barRadius: Radius.circular(10),
                                            backgroundColor: Colors.grey,
                                          ),
                                          SizedBox(height: 5,),
                                          Text("\$"+campaign[index]['collectedMoney']+" collected",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500, color: Colors.white),)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
