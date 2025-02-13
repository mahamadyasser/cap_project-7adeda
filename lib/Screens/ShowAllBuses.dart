import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/School_Bus_Parent_Provider.dart';
import 'Detailsschool.dart';  // تأكد من استيراد صفحة التفاصيل

class Showallbuses extends StatelessWidget {
  final keyy=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // الحصول على الـProvider
    var busProvider = Provider.of<School_Bus_Parent_Provider>(context);

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
      body: Form(
        key: keyy,
        child: FutureBuilder(
          future: busProvider.fetchBuses(),  // جلب الحافلات عند تحميل الصفحة
          builder: (context, snapshot) {
            // حالة الانتظار
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            // حالة الخطأ
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            // عرض الحافلات عند اكتمال جلب البيانات
            return SingleChildScrollView(
              child: Column(
                children: [
                  // وضع صورة أو أي عنصر آخر هنا
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    color: Color(0xFF34D1B2),
                    child: Center(
                      child: Text(
                        'All Buses',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // عرض الحافلات
                  for (var bus in busProvider.buses)
                    Column(
                      children: [
                        Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCvCXrI6MgxpZufAs5YVyOgSonnhQbqq2apg&s", width: 300, height: 120),
                        SizedBox(height: 10),
                        Text(bus.name),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Detailsschool(busId: 1),
                              ),
                            );
                          },
                          child: Text(
                            "Show all details",
                            style: TextStyle(color: Color(0xff055c5e)),
                          ),
                        ),
                        SizedBox(height: 20), // إضافة مساحة بين الحافلات
                      ],
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
