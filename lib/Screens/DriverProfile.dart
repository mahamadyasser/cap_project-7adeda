import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Models/School_Bus_Parent_Model.dart';

class DriverProfile extends StatelessWidget {
  final Driver driver;
  final keyy=GlobalKey<FormState>();


  DriverProfile({required this.driver});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF34D1B2),
        automaticallyImplyLeading: true, // Allow back navigation
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
      body: Form(
        key: keyy,
        child: Column(
          children: [
            CustomAppBar(),
            SizedBox(height: 0),
            SingleChildScrollView(
              child: Align(
                alignment: Alignment(0.8, -2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Driver Profile",
                      style: TextStyle(fontSize: 32),
                    ),
                    SizedBox(height: 1),
                    Container(
                      height: 2,
                      width: 120,
                      color: Color(0xFF34D1B2),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Column(
                        children: [
                          Image.network(
                            "https://uploads.commoninja.com/searchengine/wordpress/user-avatar-reloaded.png",
                            height: 100,
                          ),
                          SizedBox(height: 20),
                          Text("Name  : ${driver.name}"),
                          Text("Code  : ${driver.id}"),
                          Text("Bus   : ${driver.email}"),
                          // Add other driver attributes if available
                          Text("Phone : 01286734563"),
                          Text("Address : Giza"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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