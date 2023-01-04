import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'detail_page.dart';

class CampaignPage extends StatefulWidget {
  const CampaignPage({Key? key}) : super(key: key);

  @override
  State<CampaignPage> createState() => _CampaignPageState();
}

class _CampaignPageState extends State<CampaignPage> {
  List campaign=[];
  _readData() async{
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
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: (){
                Get.back();
              }, icon: Icon(Icons.arrow_back,size: 30,)),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
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
                      height: 220,
                      margin: EdgeInsets.only(left: 05,right: 5,top: 10,bottom: 07),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(image: AssetImage(campaign[index]['image']),fit: BoxFit.cover,opacity: 0.7)
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
