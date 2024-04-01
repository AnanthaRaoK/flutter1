import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice/riverpod/riverpod.dart';
import 'package:practice/screens/createtable.dart';
import 'package:practice/screens/getotp.dart';
import 'package:practice/test1.dart';

import '../datamodels/listviewapi.dart';
import 'login.dart';

void main() {
  runApp(ProviderScope(
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    print('iiiiiiiiiiii');

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const LoginScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
      _tabController=TabController(length: 3, vsync: this);

  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(10),
          child: Column (
          children: <Widget>[
            AppBar(
              title: Text(
                  'Profile',
                style: TextStyle(
                    color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Icon(Icons.arrow_back,color: Colors.white),
              backgroundColor: Colors.black,
              actions: [
                Icon(Icons.settings,color:Colors.white ),
              ],


            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[ Column(
                  children: [Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/img.png'),
                      radius: 50,
                    ),
                  ),
                    Text('Aaradhya',
                    style: TextStyle(color: Colors.white),),
                    Text('im a man with wheels',
                        style: TextStyle(color: Colors.white),),
                ]),
                  Column(

                    children: [
                      Text('10',
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                      Text('Rides',
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),)
                    ],
                  ),
                  Column(
                    children: [
                      Text('10k',
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                      Text('Distance(KM)',
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                    ]),

              ]),
            ),
            SizedBox(height: 10,),
            Container(
              width: 400.0,
              height: 50.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
                onPressed: () {Navigator.push(context,
                MaterialPageRoute(builder: (context)=>RiverpodScreen())
                );},
                child: Text('Become A Member',
                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
            ),
            SizedBox(height: 20,),
            Text('My Bikes',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
            Container(
              height: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        height: 10,width: 190,color: Colors.grey,
                    ),
                    );
                  },
                ),
            ),
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: 'post',),
                Tab(text: 'clubs',),
                Tab(text: 'discount',),
              ],
            ),
          Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Card(
                              child: Image.asset('assets/img.png',
                                fit: BoxFit.cover,
                              ),

                            ),
                          ),
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Card(
                              child: Image.asset('assets/img.png',
                                fit: BoxFit.cover,
                              ),

                            ),
                          ),SizedBox(
                            width: 100,
                            height: 100,
                            child: Card(
                              child: Image.asset('assets/img.png',
                                fit: BoxFit.cover,
                              ),

                            ),
                          ),
                        ],
                      )
                    ],
                  ),Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Card(
                              child: Image.asset('assets/img.png',
                                fit: BoxFit.cover,
                              ),

                            ),
                          ),
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Card(
                              child: Image.asset('assets/img.png',
                                fit: BoxFit.cover,
                              ),

                            ),
                          ),SizedBox(
                            width: 100,
                            height: 100,
                            child: Card(
                              child: Image.asset('assets/img.png',
                                fit: BoxFit.cover,
                              ),

                            ),
                          ),
                        ],
                      )
                    ],
                  ),Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Card(
                              child: Image.asset('assets/img.png',
                                fit: BoxFit.cover,
                              ),

                            ),
                          ),
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Card(
                              child: Image.asset('assets/img.png',
                                fit: BoxFit.cover,
                              ),

                            ),
                          ),SizedBox(
                            width: 100,
                            height: 100,
                            child: Card(
                              child: Image.asset('assets/img.png',
                                fit: BoxFit.cover,
                              ),

                            ),
                          ),
                        ],
                      )
                    ],
                  ),

                ],
              ))
    ]),
      )
    );
  }
}
