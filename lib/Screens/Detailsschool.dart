import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/School_Bus_Parent_Provider.dart';

class Detailsschool extends StatelessWidget {
  final keyy=GlobalKey<FormState>();
  final int busId; // ID of the selected bus

  Detailsschool({required this.busId});

  @override
  Widget build(BuildContext context) {
    final busProvider = Provider.of<School_Bus_Parent_Provider>(context,listen: false);

    // Load bus details when the widget is built
    if (busProvider.buses.isEmpty && !busProvider.isLoading) {
      busProvider.fetchBusById(busId);
    }

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
            SizedBox(height: 20), // Space between CustomAppBar and content
            Expanded(
              child: busProvider.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : busProvider.errorMessage.isNotEmpty
                  ? Center(child: Text(busProvider.errorMessage))
                  : SingleChildScrollView(
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Bus Details",
                        style: TextStyle(fontSize: 32),
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 2,
                        width: 120,
                        color: Color(0xFF34D1B2),
                      ),
                      SizedBox(height: 20),
                      Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCvCXrI6MgxpZufAs5YVyOgSonnhQbqq2apg&s",
                        width: 300,
                        height: 120,
                      ),
                      SizedBox(height: 20),
                      Text("Bus : ${busProvider.buses[0].name}"),
                      Text("id: ${busProvider.buses[0].id}"),
                      TextButton(
                        onPressed: () {
                          // Handle live location
                          // You can implement your logic here
                        },
                        child: Text(
                          'Live Location',
                          style: TextStyle(color: Color(0xBD1EB597)),
                        ),
                      ),
                      Text("Driver Name: ${busProvider.buses[0]}"),
                      Text(
                        'Driver Code: ${busProvider.buses[0]}',
                        style: TextStyle(color: Color(0xBD1EB597)),
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle students
                          // You can implement your logic here
                        },
                        child: Text(
                          'Students',
                          style: TextStyle(color: Color(0xBD1EB597)),
                        ),
                      ),
                    ],
                  ),
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