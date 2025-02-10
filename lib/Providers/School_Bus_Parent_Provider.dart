import 'package:flutter/cupertino.dart';

import '../Models/School_Bus_Parent_Model.dart';
import '../Services/School_Bus_Parent_Service.dart';

class School_Bus_Parent_Provider extends ChangeNotifier {
  School_Bus_Parent_Show_Buses_Model? school_Bus_Parent_Show_Buses_Model;

  Future<void> fetchregister({
    required String buscode,
    required String place,
  }) async {
    school_Bus_Parent_Show_Buses_Model =
        await School_Bus_Parent_Service.showbus(buscode: buscode, place: place);
    notifyListeners();
  }
}
