
class School_Bus_Parent_Show_Buses_Model {
  final int id;
  final String name;
  final String route;

  School_Bus_Parent_Show_Buses_Model(
      {required this.id, required this.name, required this.route});

  factory School_Bus_Parent_Show_Buses_Model.fromJson(
      Map<String, dynamic> json) {
    return School_Bus_Parent_Show_Buses_Model(
      id: json['id'],
      name: json['name'],
      route: json['route'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'route': route,
    };
  }

}
class Driver {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String vehicleType;

  Driver({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.vehicleType,
  });

  // تحويل JSON إلى كائن من نوع Driver
  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      vehicleType: json['vehicleType'],
    );
  }

  // تحويل كائن Driver إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
       'phone': phone,
       'vehicleType': vehicleType,
    };
  }

}
