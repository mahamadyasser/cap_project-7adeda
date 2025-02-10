
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomePageSchool.dart';

class AddStudent extends StatelessWidget {
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
                      "Add Student",
                      style: TextStyle(fontSize: 32), // حجم النص
                    ),
                    SizedBox(height: 4), // مسافة بين النص والخط
                    Container(
                      height: 2, // ارتفاع الخط
                      width: 60, // عرض الخط
                      color: Color(0xFF34D1B2), // لون الخط
                    ),
                    SizedBox(height: 10), // مسافة بين الخط وحقول الإدخال
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding من الحافة اليمنى واليسرى
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Name',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF34D1B2),), // تحديد لون البوردر الأخضر
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF34D1B2),), // بوردر عندما لا يكون الحقل مفعلاً
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF34D1B2),), // بوردر عندما يكون الحقل مفعلاً
                                ),
                              ),
                              maxLines: 1, // تحديد الحد الأقصى لعدد الأسطر
                            ),
                          ),
                          SizedBox(height: 8,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding من الحافة اليمنى واليسرى
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Code',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF34D1B2),), // تحديد لون البوردر الأخضر
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF34D1B2),), // بوردر عندما لا يكون الحقل مفعلاً
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF34D1B2),), // بوردر عندما يكون الحقل مفعلاً
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding من الحافة اليمنى واليسرى
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Phone',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF34D1B2),), // تحديد لون البوردر الأخضر
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF34D1B2),), // بوردر عندما لا يكون الحقل مفعلاً
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF34D1B2),), // بوردر عندما يكون الحقل مفعلاً
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding من الحافة اليمنى واليسرى
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Address',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF34D1B2),), // تحديد لون البوردر الأخضر
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF34D1B2),), // بوردر عندما لا يكون الحقل مفعلاً
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF34D1B2),), // بوردر عندما يكون الحقل مفعلاً
                                ),
                              ),
                            ),
                          ),
              
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HPS()));
                            },
                            child: Text('Done!',style: TextStyle(color:Colors.black),),
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
        height: MediaQuery.of(context).size.height / 6, // Adjusted height to make it shorter
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
