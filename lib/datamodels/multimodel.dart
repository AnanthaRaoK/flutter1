import 'dart:developer';

import 'package:flutter/foundation.dart';

class Multimodel{
  int? page;
  int? per_page;
  int? total;
  int? total_pages;
  List<dynamic>? data;
  Support? support;

  Multimodel({
      this.page,
      this.per_page,
      this.total,
      this.total_pages,
      required this.data,
      this.support
  });

  factory Multimodel.fromJson(Map<String,dynamic>parseJson) {
    var list=parseJson['data'] as List;

    print(list.runtimeType);
    List<dynamic> datalist=list.map((i) => Data.fromJson(i)).toList();
    return Multimodel(
    page: parseJson['page'],
    per_page: parseJson['per_page'],
    total: parseJson['total'],
    total_pages: parseJson['total_pages'],
    data: datalist,
    support: Support.fromJson(parseJson['support'])
    );
  }
}

class Data{
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
class Support {
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