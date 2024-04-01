import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/riverpod/riverpod%20api.dart';

import '../datamodels/listviewapi.dart';


class RiverpodScreen extends ConsumerStatefulWidget {
  const RiverpodScreen({super.key});

  @override
  ConsumerState<RiverpodScreen> createState() => _RiverpodScreenState();
}

class _RiverpodScreenState extends ConsumerState<RiverpodScreen> {
  @override
  Widget build(BuildContext context) {
    final rr=ref.watch(userrepository);
    return Scaffold(
      appBar: AppBar(
        title: Text('userinfo'),
      ),
      body: rr.when(data:(rr){
        return Column(
          children: [
            Image.network('${rr?.data?.avatar}'),
            SizedBox(height: 10,),
            Text('${rr?.data?.first_name} ${rr?.data?.last_name}',
              style: TextStyle(color: Colors.black),
            ),
            Text('${rr?.data?.email}',
              style: TextStyle(color: Colors.black),
            ),
            Text('${rr?.support?.url}',
              style: TextStyle(color: Colors.black),
            ),
            Text('${rr?.support?.text}',
              style: TextStyle(color: Colors.black),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=>Listviewapi()),);
              },
               child: Text('Next page',
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
                ],
        );
      },
          error: (err, stack) => Text('Error'),
          loading:()=>CircularProgressIndicator()),
    );
  }
}

