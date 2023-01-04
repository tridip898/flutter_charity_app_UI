import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Detailpage extends StatelessWidget {
  const Detailpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 95,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.orangeAccent.withOpacity(0.7)
          ),
          child: Text("DONATE NOW",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800,color: Colors.blueGrey),),
        ),
        body: Container(
          height: height,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height*0.4,
                width: width,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(Get.arguments['image']),fit: BoxFit.cover)
                ),
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            shape: BoxShape.circle
                          ),
                          child: IconButton(onPressed: (){
                            Get.back();
                          }, icon: Icon(Icons.arrow_back,color: Colors.white,size: 30,)),
                        ),
                        Expanded(child: Container()),
                        Icon(Icons.file_upload_outlined,size: 30,color: Colors.white,),
                        SizedBox(width: 10,),
                        Icon(Icons.favorite_rounded,size: 30,color: Colors.white,),
                      ],
                    ),
                    Row(
                      children: [
                        Text("FRIENDS OF THE EARTH",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w600),),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          padding: EdgeInsets.all(7),
                          child: Text("POLLUTION",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('PROJECT\t"'+Get.arguments['project']+'"',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700),),
                    SizedBox(height: 10,),
                    Text(Get.arguments['title'],style: TextStyle(fontSize: 28,fontWeight: FontWeight.w600),),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.calendar_month_outlined,size: 30,color: Colors.orangeAccent,),
                                SizedBox(height: 3,),
                                Text("Deadline",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                                SizedBox(height: 3,),
                                Text(Get.arguments['deadline']+" days",style: TextStyle(fontSize: 20),)
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.group_outlined,size: 30,color: Colors.orangeAccent,),
                                SizedBox(height: 3,),
                                Text("Supporters",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                                SizedBox(height: 3,),
                                Text(Get.arguments['supporters']+"\tusers",style: TextStyle(fontSize: 20),)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.collections_outlined,size: 30,color: Colors.orangeAccent,),
                                SizedBox(height: 3,),
                                Text("Collected",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                                SizedBox(height: 3,),
                                Text("\$"+Get.arguments['collectedMoney'],style: TextStyle(fontSize: 20),)
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.flag_outlined,size: 30,color: Colors.orangeAccent,),
                                SizedBox(height: 3,),
                                Text("Total",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                                SizedBox(height: 3,),
                                Text("\$"+Get.arguments['totalMoney'],style: TextStyle(fontSize: 20),)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
