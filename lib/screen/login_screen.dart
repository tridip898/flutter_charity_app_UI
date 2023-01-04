import 'package:charity_app_ui/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          width: width,
          color: Colors.pink.shade400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("lib/icons/logo.png",height: 180,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                      onPressed: (){
                        Get.to(()=>HomeScreen());
                      },
                    child: Text("SIGN UP",style: TextStyle(fontSize: 20,color: Colors.grey.shade100),),
                  ),
                  Text("or",style: TextStyle(fontSize: 20,color: Colors.white),),
                  MaterialButton(
                    onPressed: (){
                      Get.to(()=>HomeScreen());
                    },
                    child: Text("LOG IN",style: TextStyle(fontSize: 20,color: Colors.grey.shade100),),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Container(
                height: 60,
                width: width*0.82,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(25)
                ),
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Icon(Icons.apple,color: Colors.white,size: 40,),
                    SizedBox(width: 30,),
                    Text("Continue with apple",style: TextStyle(fontSize: 18,color: Colors.white))
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 60,
                width: width*0.82,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(25)
                ),
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Icon(Icons.facebook,color: Colors.blue,size: 40,),
                    SizedBox(width: 30,),
                    Text("Signup with facebook",style: TextStyle(fontSize: 18,color: Colors.blue))
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 60,
                width: width*0.82,
                decoration: BoxDecoration(
                    color: Colors.orange.shade200,
                    borderRadius: BorderRadius.circular(25)
                ),
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text("Have an account?",style: TextStyle(fontSize: 18,color: Colors.black)),
                        Text("Login",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
