import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:health/screens/MedCardScreen.dart';
// import 'package:health/screens/challenge_screen.dart';
import 'package:health/screens/home_screen.dart';
import 'package:health/screens/log_workout.dart';
import 'package:health/screens/login_screen.dart';
import 'package:health/screens/log_calories.dart';
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
      initialRoute: HomeScreen.id,
      routes: {
        // ChallengeScreen.id: (context) => ChallengeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        LogCalories.id: (context) => LogCalories(),
        LogWorkout.id: (context) => LogWorkout(),
        ProfileScreen.id: (context) => ProfileScreen(),
        MedCardScreen.id: (context) => MedCardScreen(),
        ShopScreen.id: (context) => ShopScreen(),
        ChecklistScreen.id: (context) => ChecklistScreen(),
      },
    );
  }
}
