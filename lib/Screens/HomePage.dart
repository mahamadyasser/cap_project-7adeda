
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomePageSchool.dart';
import 'Login.dart';

class Homepage extends StatelessWidget {
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
                alignment: Alignment(0.3, 1), // تعديل قيمة الـ alignment لرفع الكلمة أكثر
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start, // وضع العناصر في الأعلى
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(fontSize: 32), // حجم النص
                    ),
                    SizedBox(height: 8), // مسافة بين النص والخط
                    Container(
                      height: 2, // ارتفاع الخط
                      width: 120, // عرض الخط
                      color: Color(0xFF34D1B2), // لون الخط
                    ),
                    SizedBox(height: 16), // مسافة بين الخط وحقول الإدخال
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding من الحافة اليمنى واليسرى
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 20,),
                                SizedBox(height: 20,),
                                Text(
                                  "Please! choose your role in the application",
                                  style: TextStyle(color: Colors.grey, fontSize: 25),
                                ),
                                SizedBox(height: 100),
                                SizedBox(
                                  width: double.infinity, // تجعل الزر يأخذ كل العرض المتاح
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => HPS()));
                                    },
                                    child: Text('School', style: TextStyle(color: Colors.white,fontSize: 15)),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF34D1B2),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                SizedBox(
                                  width: double.infinity, // تجعل الزر يأخذ كل العرض المتاح
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                                    },
                                    child: Text('Parent', style: TextStyle(color: Colors.white,fontSize: 15)),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF34D1B2),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
