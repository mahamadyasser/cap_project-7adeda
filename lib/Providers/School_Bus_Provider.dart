
import 'package:flutter/cupertino.dart';

import '../Models/School_Bus_Sign_Model.dart';
import '../Services/School_Bus_Service.dart';

class School_Bus_Sign_Provider extends ChangeNotifier{
  Loginn?school_Bus_Model;
  signupp?signuppp;
  Future<void> fetchSignup({required String name,required String email,required String phone,required String password})async{
    signuppp=await School_Bus_Sign_Service.signup(name: name, email: email, phone: phone, password: password);
    notifyListeners();

  }

  Future<void> fetchlogin({required String email, required String password}) async {
    school_Bus_Model = await School_Bus_Sign_Service.login(email: email, password: password);
    print('Login status: ${school_Bus_Model?.status}');  // Log the status
    notifyListeners();
  }
// Future<void> fetchforgetpassword({required String email,required String password,required String confirmpassword})async{
  //   school_Bus_Model=await School_Bus_Sign_Service.ForgetPassword(email: email, password: password, confirmpassword: confirmpassword);
  //   notifyListeners();
  //
  // }

}