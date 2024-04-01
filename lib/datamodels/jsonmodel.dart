

import 'package:flutter/foundation.dart';

class Model{
  Data? data;
  Support? support;
  Model({
    this.data,
    this.support
  });
  factory Model.fromJson(Map<String,dynamic> parseJson){
    return Model(
        data:Data.fromJson(parseJson['data']),
        support:Support.fromJson(parseJson['support'])
    );
  }
}
class Data {
  int? id;
  String? email;
  String? first_name;
  String? last_name;
  String? avatar;

  Data({
    this.id,
    this.email,
    this.first_name,
    this.last_name,
    this.avatar

  });
  factory Data.fromJson(Map<String ,dynamic> parseJson){
    return Data(
        id:parseJson['id'],
        email: parseJson['email'],
        first_name: parseJson['first_name'],
        last_name: parseJson['last_name'],
        avatar: parseJson['avatar']

    );
  }
}
class Support{
  String? url;
  String? text;
  Support({
    this.url,
    this.text
});
  factory Support.fromJson(Map<String, dynamic> parseJson){
    return Support(
        url: parseJson['url'],
        text: parseJson['text']
    );
  }
}

class CreateTable{
  String? name;
  String? job;
  CreateTable({
    this.name,this.job
});
  static toJson(CreateTable createTable)=>{
    "name": createTable.name,
    "job": createTable.job
  };
}



