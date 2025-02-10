
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Checklist extends StatefulWidget {
  @override
  State<Checklist> createState() => _ChecklistState();
}

class _ChecklistState extends State<Checklist> {
  List<String> studentNames = [
    'Student 1',
    'Student 2',
    'Student 3',
    'Student 4',
  ];

  List<List<bool>> checkStates = List.generate(4, (_) => [false, false]);

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
                      "Home Page",
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
                      child: Expanded( // إضافة Expanded هنا
                        child: ListView.builder(
                            itemCount: studentNames.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(studentNames[index]),
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: checkStates[index][0],
                                          onChanged: (bool? value) {
                                            setState(() {
                                              checkStates[index][0] = value ?? false;
                                            });
                                          },
                                        ),
                                        Checkbox(
                                          value: checkStates[index][1],
                                          onChanged: (bool? value) {
                                            setState(() {
                                              checkStates[index][1] = value ?? false;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }
                        ),
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