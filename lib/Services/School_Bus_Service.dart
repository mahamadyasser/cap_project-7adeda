import 'package:dio/dio.dart';
import 'package:schoolbus/Screens/Forget_Password.dart';

import '../Models/School_Bus_Sign_Model.dart';

class School_Bus_Sign_Service{
  static Dio dio=Dio();
  static Future <School_Bus_Model> signup({required String name,required String email,required String phone,required String password})async
  {
    Response response =await dio.post('https://localhost:7163/api/SignUp',
      data:
        {
          'name':name,
          'email':email,
          'phone':phone,
          'password':password
        }
    );
    if(response.statusCode==200)
      {
        return School_Bus_Model.fromjson(response.data);
      }
    else{
      throw Exception('error');
    }
  }
  static Future <School_Bus_Model> login({required String email,required String password})async
  {
    Response response =await dio.post('https://localhost:7163/api/Login?password=1',
        data:
        {
          'email':email,
          'password':password
        }
    );
    if(response.statusCode==200)
    {
      return School_Bus_Model.fromjson(response.data);
    }
    else{
      throw Exception('error');
    }
  }
  static Future <School_Bus_Model> ForgetPassword({required String email,required String password,required String confirmpassword})async
  {
    Response response =await dio.post('https://localhost:7163/api/ForgetPassword?id=1',
        data:
        {
          'email':email,
          'password':password,
          'confirmpassword':confirmpassword
        }
    );
    if(response.statusCode==200)
    {
      return School_Bus_Model.fromjson(response.data);
    }
    else{
      throw Exception('error');
    }
  }
}