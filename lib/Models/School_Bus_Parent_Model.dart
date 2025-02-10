
class School_Bus_Parent_Show_Buses_Model{
  Map<String,dynamic>show_bus;
  School_Bus_Parent_Show_Buses_Model({required this.show_bus});
  factory School_Bus_Parent_Show_Buses_Model.fromjson(Map<String,dynamic>json)
  {
    return School_Bus_Parent_Show_Buses_Model(show_bus: json["bus"]);
  }
}