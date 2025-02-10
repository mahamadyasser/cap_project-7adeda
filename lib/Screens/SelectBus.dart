
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/School_Bus_Parent_Model.dart';
import 'Details.dart';

class Selectbus extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var opj = Provider.of<School_Bus_Parent_Show_Buses_Model>(context, listen: false);
    var keyy = GlobalKey<FormState>();



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
        body: Form(
          key: keyy,
          child: Column(
            children: [
              CustomAppBar(), // إضافة CustomAppBar هنا
              SizedBox(height: 0), // إزالة المسافة بين CustomAppBar و Login
              SingleChildScrollView(
                child: Align(
                  alignment: Alignment(0.8, -2.0), // تعديل قيمة الـ alignment لتحريك الكلمة لليمين
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCvCXrI6MgxpZufAs5YVyOgSonnhQbqq2apg&s",width: 300,height: 120,),
                      SizedBox(height: 20,),
                      Text("Bus Name"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(onPressed:(){
                             Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Details()));
                          },
                            child: Text("Show all details",style: TextStyle(color: Color(0xff055c5e)),),
                          ),
                          MaterialButton(
                            onPressed: () {

                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Details()));
                            },
                            child: Text("Select"),
                            color: Color(0xff23e0d7),
                          ),
                        ],
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCvCXrI6MgxpZufAs5YVyOgSonnhQbqq2apg&s",height: 120,width: 500,),
                            SizedBox(height: 20,),
                            Text("Bus Name"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(onPressed:(){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Details()));
                                },
                                  child: Text("Show all details",style: TextStyle(color: Color(0xff055c5e)),),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Details()));
                                  },
                                  child: Text("Select"),
                                  color: Color(0xff23e0d7),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
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
