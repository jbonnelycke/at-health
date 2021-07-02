import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:health/components/CompTabBar.dart';
import 'package:health/components/HealthBar.dart';
import 'package:health/screens/tabs/ChallengeScreebTab.dart';
import 'package:health/screens/tabs/HomeScreenTab.dart';
import 'package:health/screens/tabs/profile_screen.dart';
// import 'package:health/screens/tabs/homeScreen.dart';
import 'package:health/constants.dart';

class HomeScreen extends StatefulWidget {
  static final String id = 'challenge';
  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: HealthBar(bottom: CompTabBar()),
          body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AtHealth.primaryColor, AtHealth.secondaryColor],
               )),
              child: TabBarView(
                children: [
                  HomeScreenTab(context),
                  ChallengeScreenTab(),
                  Text("Was"),
                  ProfileScreen()
                ],
              ))),
    );
  }
}
