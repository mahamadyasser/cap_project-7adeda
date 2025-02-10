
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DriverProfile.dart';
import 'LiveLocation.dart';
import 'Students.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF34D1B2),
          automaticallyImplyLeading: false, // إزالة الأيقونة
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Header'),
                decoration: BoxDecoration(
                  color: Color(0xFF34D1B2),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            CustomAppBar(),
            SizedBox(height: 20), // إضافة مسافة بين CustomAppBar والمحتوى
            Expanded(
              child: SingleChildScrollView(
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Bus Details",
                        style: TextStyle(fontSize: 32),
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 2,
                        width: 120,
                        color: Color(0xFF34D1B2),
                      ),
                      SizedBox(height: 20),
                      Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCvCXrI6MgxpZufAs5YVyOgSonnhQbqq2apg&s",
                        width: 300,
                        height: 120,
                      ),
                      SizedBox(height: 20),
                      Text("Bus Name: Elsalam"),
                      Text("Code: 01122"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LiveLocation()),
                          );
                        },
                        child: Text(
                          'Live Location',
                          style: TextStyle(color: Color(0xBD1EB597)),
                        ),
                      ),
                      Text("Driver Name: Mahamed Sayed"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Driverprofile()),
                          );
                        },
                        child: Text(
                          'Driver Code: 052207',
                          style: TextStyle(color: Color(0xBD1EB597)),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Studentprofile()),
                          );
                        },
                        child: Text(
                          'Students',
                          style: TextStyle(color: Color(0xBD1EB597)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipper(),
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        color: Color(0xFF34D1B2),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(size.width / 4, size.height + 40, size.width / 2, size.height - 60);
    path.quadraticBezierTo(size.width * 3 / 4, size.height - 160, size.width, size.height - 60);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}