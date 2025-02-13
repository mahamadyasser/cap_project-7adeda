import 'package:dio/dio.dart';
import 'package:schoolbus/Screens/Forget_Password.dart';

import '../Models/School_Bus_Sign_Model.dart';

class School_Bus_Sign_Service{
  static Dio dio=Dio();
  static Future<signupp> signup({required String name,required String email,required String phone,required String password})async
  {
    Response response =await dio.post('https://localhost:7163/api/SignUp/Sign Up',




    );
    if(response.statusCode==200)
      {
        return signupp.fromjson(response.data);
      }
    else{
      throw Exception('error');
    }
  }
  static Future<Loginn> login({required String email, required String password}) async {
    try {
      Response response = await dio.post('https://localhost:7163/api/Login?email=$email&password=$password');


      if (response.statusCode == 200) {
        return Loginn.fromjson(response.data);
      } else {
        throw Exception('Error: ${response.statusCode}');  // More descriptive error
      }
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  static Future <Loginn> ForgetPassword({required String email,required String password,required String confirmpassword})async
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
      return Loginn.fromjson(response.data);
    }
    else{
      throw Exception('error');
    }
  }
}