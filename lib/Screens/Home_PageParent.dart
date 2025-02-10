
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SelectBus.dart';

class HomePageparent extends StatelessWidget {
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
              CustomAppBar(), // إضافة CustomAppBar هنا
              SizedBox(height: 0), // إزالة المسافة بين CustomAppBar و Login
              SingleChildScrollView(
                child: Align(
                  alignment: Alignment(0.8, -2.0), // تعديل قيمة الـ alignment لتحريك الكلمة لليمين
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start, // وضع العناصر في الأعلى
                    children: [
                      Text(
                        "Home Page",
                        style: TextStyle(fontSize: 32), // حجم النص
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 2,
                        width: 60,
                        color: Color(0xFF34D1B2),
                      ),
                      SizedBox(height: 16),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCvCXrI6MgxpZufAs5YVyOgSonnhQbqq2apg&s",),
                            SizedBox(height: 16,),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Selectbus()));
                              },
                              child: Text('get Started',style: TextStyle(color:Colors.black),),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF34D1B2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]
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
        height: MediaQuery.of(context).size.height / 3, // Adjusted height to make it shorter
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
