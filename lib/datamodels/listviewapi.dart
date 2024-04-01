import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/riverpod/riverpod%20api.dart';

class Listviewapi extends ConsumerStatefulWidget {
  const Listviewapi({super.key});

  @override
  ConsumerState<Listviewapi> createState() => _ListviewapiState();
}

class _ListviewapiState extends ConsumerState<Listviewapi> {
  @override
  Widget build(BuildContext context) {
    final rr=ref.watch(mmodelrepository);
    return Scaffold(
      appBar: AppBar(
        title: Text('something'),
      ),
      body: rr.when(
          data: (rr){
             return Column(
              children: [
                Text('${rr?.support?.text}',
                  style: TextStyle(color: Colors.black),
                  ),
                SizedBox(height: 50,),
                Container(
                  height: 200,
                  child: ListView.builder (
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount:  rr?.data?.length,
                      itemBuilder: (BuildContext context,int index){
                        return Column(
                          children: [
                            Image.network('${rr!.data?[index].avatar}'),
                            SizedBox(height: 20,),
                            Text('${rr?.data?[index].first_name} ${rr?.data?[index].last_name}',
                            style: TextStyle(color: Colors.black),)
                          ],
                        );
                      }
                  ),
                )
              ],
             );
                  },
          error: (err, stack) => Text('Error $err'),
          loading: ()=>const CircularProgressIndicator()),
    );
  }
}
