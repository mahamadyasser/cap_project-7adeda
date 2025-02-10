
import 'package:dio/dio.dart';

import '../Models/School_Bus_Parent_Model.dart';
import '../Models/School_Bus_Sign_Model.dart';

class School_Bus_Parent_Service {
  static Dio dio = Dio();
  static Future<School_Bus_Parent_Show_Buses_Model> showbus({
    required String buscode,
    required String place,

  }) async {
    Response response = await dio
        .post('https://localhost:7163/api/Bus', data: {
      'buscode': buscode,
      'place': place,

    });
    if (response.statusCode == 200) {
      return School_Bus_Parent_Show_Buses_Model.fromjson(response.data);
    } else {
      throw Exception('invalid');
    }
  }


}
