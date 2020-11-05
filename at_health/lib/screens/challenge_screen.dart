import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:health/components/CompTabBar.dart';
import 'package:health/components/HealthBar.dart';
import 'package:health/screens/tabs/HomeScreenTab.dart';
// import 'package:health/screens/tabs/homeScreen.dart';

class ChallengeScreen extends StatefulWidget {
  static final String id = 'challenge';
  @override
  _ChallengeScreenState createState() {
    return _ChallengeScreenState();
  }
}

class _ChallengeScreenState extends State<ChallengeScreen> {
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
                      end: Alignment(0.0, 0.9),
                      colors: [Color(0xffFFE4BC), Color(0xffF55E61)],
                      stops: [0.9, 1])),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TabBarView(
                  children: [
                    HomeScreenTab(context),
                    Text("Junior"),
                    Text("Was"),
                    Text("Here")
                  ],
                ),
              ))),
    );
  }
}
