import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'datamodels/jsonmodel.dart';
import 'datamodels/multimodel.dart';

class User {

  final Dio dio = Dio();

  Future<Model?> getModel() async {
    Model? user;
    Response response;

    try {
      response = await dio.get('https://reqres.in/api/users/2');
      user=Model.fromJson(response.data);
      return user;
    }on DioError
    catch (e) {
     if (e.response?.statusCode==404){
       print('error');
     }
    }
  }
}


class MultiUserModel{
  final Dio dioClint=Dio();
  
  Future<Multimodel?> getMultiModel() async{
    Multimodel mmodel;
    Response response;
    try{
      response=await dioClint.get("https://reqres.in/api/users?page=2");
      mmodel=Multimodel.fromJson(response.data);
      return mmodel;
    }on DioError
    catch (e) {
      if (e.response?.statusCode==500){
        print('error');
      }
    }
  }
  
}
class ApiClient{
  final Dio apidio=Dio();



  Future getApiClient(String email) async{

    print('--------------------- insideapiclient');
//https://dev-api.realroadies.com/email/login/start?email=pavanhegde81%40gmail.com
   // Response response;
    try {
      var response = await apidio.post(
          'https://dev-api.realroadies.com/email/login/start?email=$email',
      //     queryParameters: {
      //
      //       'email' : email
      //https://dev-api.realroadies.com/mobile/get/access-token?mobile_phone=anantharaok2001%40gmal.com&otp=974654
      // }
      );

      print('Success ${response.data}');

      if(response.statusCode == 200){

        print('Success ${response.data}');

      }
    }
    catch (e){
      print(e.toString());
    }
  }

  Future otpapi( {required String email,required String otp}) async {

    try{
      var response1=await apidio.post(
        'https://dev-api.realroadies.com/mobile/get/access-token?mobile_phone=$email&otp=$otp'
      );
      if (response1.statusCode==200)
        {
          print(response1.data);
        }
    }
    catch(e){
      print(e.toString());
    }
  }


  Future createdata({required String name,required String job}) async{
    try{
      var response2=await apidio.post('https://reqres.in/api/users');
      if(response2.statusCode==201){
        print(response2.data);
      }
    }
    catch(e){
      print(e.toString());
    }
  }

}