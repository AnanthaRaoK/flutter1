import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice/api.dart';

import 'getotp.dart';
import 'main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController  emailcontrol=TextEditingController();
  ApiClient apiClient=ApiClient();
  // _latestvalue(){
  //   ApiClient().getApiClient( emailcontrol.toString());
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 70,),
              Text('Get Started',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text('What is your phone number?',
                style: GoogleFonts.poppins(
                  color: Colors.white,fontSize: 18
                ) ,
                ),
              ),
              SizedBox(height: 25,),
              Text('Input field with this (*)symbol \n are marked as mandatory',
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 12,
              ),
              ),
              SizedBox(height: 30,),
              Expanded(
                flex: 10,
                child: TextFormField(
                  controller: emailcontrol,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    hintText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 25,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  shape: RoundedRectangleBorder(),
                  minimumSize: Size(343, 40),
                ),
                  onPressed:()  async{
                  await apiClient.getApiClient(emailcontrol.text);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpPage(email: '$emailcontrol',)));
                  } , child: Text('Get OTP',
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
              )
              )
            ],
          ),
        ),
      ),
    );
  }
}
