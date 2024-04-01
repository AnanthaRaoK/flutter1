import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/api.dart';
import 'package:practice/datamodels/jsonmodel.dart';
import 'package:practice/riverpod/riverpod%20api.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

  class _HomePageState extends State<HomePage>{
  final User user=User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('user Info',
        style: TextStyle(color: Colors.black),),
      ),
          body:Center (
          child: FutureBuilder<Model?>(
            future: user.getModel(),
            builder: (context,snapshot){
              Model? userinfo=snapshot.data;
              if(snapshot.hasData){
                  return Column(
                    children: [
                      Image.network('${userinfo?.data?.avatar}'),
                      SizedBox(height: 10,),
                      Text('${userinfo?.data?.first_name} ${userinfo?.data?.last_name}',
                      style: TextStyle(color: Colors.black),
                      ),
                      Text('${userinfo?.data?.email}',
                      style: TextStyle(color: Colors.black),
                      ),
                      Text('${userinfo?.support?.url}',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text('${userinfo?.support?.text}',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  );
                  }
              return CircularProgressIndicator();
            },
          ),
          ),
    );
  }

}