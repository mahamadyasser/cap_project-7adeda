class School_Bus_Model{
  Map<String,dynamic>user;
  bool Status;
  School_Bus_Model({required this.user,required this.Status});
  factory School_Bus_Model.fromjson(Map<String,dynamic>json)
  {
    return School_Bus_Model(user: json['user'], Status: json['status']);
  }
}
class Loginn {
   bool status;
  Loginn({required this.status});

  factory Loginn.fromjson(bool json)
  {
    return Loginn(status: json);
  }
  }
class signupp {
  bool status;
  signupp({required this.status});

  factory signupp.fromjson(bool json)
  {
    return signupp(status: json);
  }
}
