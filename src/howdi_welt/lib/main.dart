import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter/material.dart';
import './homePage.dart';

void main() {
  enableFlutterDriverExtension();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo (Flutter Driver .Net Bindings Test App)',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'appium-flutter-driver .Net Test App'),
    );
  }
}
