
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AddStudent.dart';
import 'CheckList.dart';
import 'ShowAllBuses.dart';
import 'ShowAllDrivers.dart';

class HPS extends StatelessWidget {
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
        body: Expanded(
          child: Column(
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
                      SizedBox(height: 8), // مسافة بين النص والخط
                      Container(
                        height: 2, // ارتفاع الخط
                        width: 60, // عرض الخط
                        color: Color(0xFF34D1B2), // لون الخط
                      ),
                      SizedBox(height: 100), // مسافة بين الخط وحقول الإدخال
                      SizedBox(
                        width: double.infinity, // تجعل الزر يأخذ كل العرض المتاح
                        child: ElevatedButton(
                          onPressed: () {
                          },
                          child: Text('Create Profile For Driver', style: TextStyle(color: Colors.black,fontSize: 15)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF34D1B2),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity, // تجعل الزر يأخذ كل العرض المتاح
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Showallbuses()));
                          },
                          child: Text('Show All Buses', style: TextStyle(color: Colors.black,fontSize: 15)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF34D1B2),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity, // تجعل الزر يأخذ كل العرض المتاح
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Showalldrivers()));
                          },
                          child: Text('Show Profile Of Driver', style: TextStyle(color: Colors.black,fontSize: 15)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF34D1B2),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity, // تجعل الزر يأخذ كل العرض المتاح
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  AddStudent()));
                          },
                          child: Text('Add Student', style: TextStyle(color: Colors.black,fontSize: 15)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF34D1B2),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity, // تجعل الزر يأخذ كل العرض المتاح
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Checklist()));
                          },
                          child: Text('Check List', style: TextStyle(color: Colors.black,fontSize: 15)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF34D1B2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(), // إضافة Spacer لدفع العناصر لأعلى ومنعها من الوصول لأسفل الشاشة
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
