import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schoolbus/Screens/Signup.dart';

import 'Providers/School_Bus_Parent_Provider.dart';
import 'Providers/School_Bus_Provider.dart';
import 'Screens/Home_PageParent.dart';
import 'Screens/Login.dart';
import 'Screens/SelectBus.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>School_Bus_Sign_Provider()),
        ChangeNotifierProvider(create: (context)=>School_Bus_Parent_Provider()),
        ChangeNotifierProvider(create: (context)=>DriverProvider()),

      ],
      child: MaterialApp(

        home:Sign_up(),
      ),
    );
  }
}

