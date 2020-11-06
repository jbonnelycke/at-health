import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:health/screens/home_screen.dart';
import 'package:health/screens/login_screen.dart';
import 'package:health/screens/profile_screen.dart';
import 'package:health/screens/medcard_screen.dart';
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
      initialRoute: ShopScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
        MedCardScreen.id: (context) => MedCardScreen(),
        ShopScreen.id: (context) => ShopScreen(),
        ChecklistScreen.id: (context) => ChecklistScreen(),
      },
    );
  }
}
