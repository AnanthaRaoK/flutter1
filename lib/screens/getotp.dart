import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/api.dart';

import 'main.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key,required this.email});
  final String email;
  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  TextEditingController otpcontroller=TextEditingController();
  ApiClient apiClient=ApiClient();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.black,
     body: Container(
       child: Padding(
         padding: EdgeInsets.all(50),
         child: Column(
           children: [
             Text('Verification Code',
             style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),
             ),
             SizedBox(height: 25,),
             Padding(padding: EdgeInsets.all(20),
               child: Text('Verification Code sent  ',
               style: TextStyle(color: Colors.white),
               ),
             ),
             SizedBox(height: 20,),
             Text('Input field with this (*)symbol \n are marked as mandatory',
             style: TextStyle(color: Colors.grey),
             ),
             SizedBox(height: 30,),
             Expanded(
               flex: 10,
               child: TextFormField(
                 controller: otpcontroller,
                 decoration: InputDecoration(
                   labelText: 'Enter OTP*'
                 ),
                 style: TextStyle(color: Colors.white),
               ),
             ),
             ElevatedButton(
               style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.yellow,
                   shape: RoundedRectangleBorder(),
                   minimumSize: Size(343, 40),),
                 onPressed: ()async{
                  await apiClient.otpapi(email:'anantharaok2001@gmail.com', otp: otpcontroller.text);
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: '',)));
                 }, child: Text('Login',
                 style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold))),
           ],
         ),
       ),
     ),
   );
  }
}
