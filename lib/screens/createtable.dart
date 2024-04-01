import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api.dart';

class table extends StatefulWidget {
  const table({super.key});

  @override
  State<table> createState() => _tableState();
}

class _tableState extends State<table> {
  TextEditingController name=TextEditingController();
  TextEditingController job=TextEditingController();
  ApiClient apiClient=ApiClient();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('creation'),
      ),
      body: Column(
        children: [TextFormField(
          controller: name,
          decoration: InputDecoration(
            labelText: 'Name',
            hintText: 'Name',
            border: OutlineInputBorder(),
          ),
        ),
          TextFormField(
            controller: job,
            decoration: InputDecoration(
              labelText: 'Job',
              hintText: 'Job',
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
              onPressed: ()async{
                await apiClient.createdata(name: name.text, job: job.text);
              },
              child: Text('press this'))
      ]),

    );
  }
}
