import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/School_Bus_Parent_Model.dart';
import '../Providers/School_Bus_Parent_Provider.dart';
import 'DriverProfile.dart';

class ShowAllDrivers extends StatelessWidget {
  final keyy=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final driverProvider = Provider.of<DriverProvider>(context);

    // Load drivers when the widget is built
    if (driverProvider.drivers.isEmpty && !driverProvider.isLoading) {
      driverProvider.loadDrivers();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF34D1B2),
        automaticallyImplyLeading: false,
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
            SizedBox(height: 0),
            driverProvider.isLoading
                ? Center(child: CircularProgressIndicator())
                : driverProvider.errorMessage != null
                ? Center(child: Text(driverProvider.errorMessage!))
                : Expanded(
              child: ListView.builder(
                itemCount: driverProvider.drivers.length,
                itemBuilder: (context, index) {
                  final driver = driverProvider.drivers[index];
                  return DriverCard(driver: driver);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DriverCard extends StatelessWidget {
  final Driver driver;

  DriverCard({required this.driver});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkS8v2vSpIzK2HCPWDdfZP3vbvQhEm5fxuwkNENSNSswbBoWScLb0h3GjVFqgZB9FEpSg&usqp=CAU",
            height: 100,
          ),
          SizedBox(height: 20),
          Text(driver.name),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DriverProfile(driver: driver), // Pass driver to profile
                ),
              );
            },
            child: Text(
              "Show all details",
              style: TextStyle(color: Color(0xff055c5e)),
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