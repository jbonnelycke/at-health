import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:health/screens/home_screen.dart';
import 'package:health/screens/login_screen.dart';
import 'package:health/screens/shop_screen.dart';
import 'package:health/screens/checklist_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '@Health Appathon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomeScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ShopScreen.id: (context) => ShopScreen(),
        ChecklistScreen.id: (context) => ChecklistScreen(),
      },
    );
  }
}
