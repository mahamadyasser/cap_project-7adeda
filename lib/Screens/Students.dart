
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CheckList.dart';

class Studentprofile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Student Profile",
                      style: TextStyle(fontSize: 32), // حجم النص
                    ),
                    SizedBox(height: 1), // مسافة بين النص والخط
                    Container(
                      height: 2, // ارتفاع الخط
                      width: 120, // عرض الخط
                      color: Color(0xFF34D1B2), // لون الخط
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Column(
                        children: [
                          Image.network("https://uploads.commoninja.com/searchengine/wordpress/user-avatar-reloaded.png",height: 100,),
                          SizedBox(height: 20,),
                          Text("Name  : Mostafa Mahmoud"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Checklist()));
                            },
                            child: Text(
                              'Code : 0522044',
                              style: TextStyle(color: Color(0xBD1EB597),),
                            ),
                          ),
                          Text("Driver : Mohamed Sayed "),
                          Text("Phone : 01286734563    "),
                          Text("Address : Cairo        "),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
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
