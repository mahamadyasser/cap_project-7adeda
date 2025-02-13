import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/School_Bus_Parent_Provider.dart';
import 'Detailsschool.dart';

class Selectbus extends StatelessWidget {
  final keyy=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var busProvider = Provider.of<School_Bus_Parent_Provider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF34D1B2),
        automaticallyImplyLeading: false,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
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
        child: Consumer<School_Bus_Parent_Provider>(
              builder:(context, value, child)
            {
        if (value.buses.length == 0) {
          value.fetchBuses();
          return Center(child: CircularProgressIndicator(),);
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(), // إضافة الـAppBar المخصص
              SizedBox(height: 10),
              // عرض الحافلات التي تم جلبها من الـProvider
              ListView.builder(
                shrinkWrap: true,
                itemCount: busProvider.buses.length,
                itemBuilder: (context, index) {
                  var bus = busProvider.buses[index];
                  return Column(
                    children: [
                      Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCvCXrI6MgxpZufAs5YVyOgSonnhQbqq2apg&s",
                          width: 300, height: 120),
                      SizedBox(height: 20),
                      Text(bus.name),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Detailsschool(busId: 1),
                                ),
                              );
                            },
                            child: Text("Select"),
                            color: Color(0xff23e0d7),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        );
            }
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
    path.quadraticBezierTo(
        size.width / 4, size.height + 40, size.width / 2, size.height - 60);
    path.quadraticBezierTo(size.width * 3 / 4, size.height - 160, size.width,
        size.height - 60);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
