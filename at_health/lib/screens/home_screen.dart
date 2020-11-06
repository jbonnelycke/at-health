import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health/screens/tabs/ChallengeScreebTab.dart';
import 'package:flutter/widgets.dart';
import 'package:at_commons/at_commons.dart';
import 'package:health/screens/profile_screen.dart';
import 'package:health/screens/log_calories.dart';
import 'package:health/screens/log_workout.dart';
import 'package:health/screens/checklist_screen.dart';
import 'package:health/screens/shop_screen.dart';
import 'package:health/services/server_demo_service.dart';
import '../utils/at_conf.dart' as conf;
import 'login_screen.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:health/screens/challenge_screen.dart';
import 'package:health/screens/log_calories.dart';
import 'package:health/screens/log_workout.dart';
import 'package:health/screens/shop_screen.dart';

class HomeScreen extends StatefulWidget {
  static final String id = 'home';

  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  // TODO: Instantiate variables
  //update
  String _key;
  String _value;

  // lookup
  TextEditingController _lookupTextFieldController = TextEditingController();
  String _lookupKey;
  String _lookupValue = '';

  // scan
  List<String> _scanItems = List<String>();

  // service
  ServerDemoService _atClientService = ServerDemoService.getInstance();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
            title: Padding(
              padding: const EdgeInsets.fromLTRB(135, 0, 0, 0),
              child: Image.asset('assets/health_logo.png'),
            ),
            backgroundColorStart: Color(0xffF55E61),
            backgroundColorEnd: Color(0xffFFE4BC)),
        body: Center(
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xffFFD4A9), Color(0xffFFBF90)])),
              child: Column(children: [
                Container(
                    width: 500,
                    height: 125,
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        color: Color(0xff5CCB88),
                        child: ButtonBar(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: FlatButton(
                                child: Icon(Icons.home_outlined,
                                    size: 50, color: Colors.black), //TODO
                                //color: Colors.blue,
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              HomeScreen()));
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: FlatButton(
                                child: Icon(Icons.fitness_center_outlined,
                                    size: 50, color: Colors.black),
                                //TODO
                                //color: Colors.blue,
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              ChallengeScreen()));
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: FlatButton(
                                child: Icon(Icons.insert_link_outlined,
                                    size: 50, color: Colors.black),
                                //color: Colors.blue,
                                onPressed: () {
                                  /** */
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: FlatButton(
                                child: Icon(Icons.account_circle_outlined,
                                    size: 50, color: Colors.black),
                                //color: Colors.blue,
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              ProfileScreen()));
                                },
                              ),
                            ),
                          ],
                        ))),
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 30.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'What\'s up Doc?',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 50,
                              fontFamily: 'RopaSans',
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Container(
                      width: (MediaQuery.of(context).size.width * 0.8) + 20,
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              width:
                                  (MediaQuery.of(context).size.width * 0.8) / 2,
                              height:
                                  (MediaQuery.of(context).size.width * 0.8) / 2,
                              child: MaterialButton(
                                padding: EdgeInsets.all(0),
                                textColor: Colors.white,
                                splashColor: Colors.greenAccent,
                                // elevation: 8.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: Container(
                                  // width: 200,
                                  // height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      gradient: LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            Color(0xff5CCB88),
                                            Color(0xffF55E61)
                                          ]),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0xfff48d7b)
                                                .withOpacity(0.7),
                                            blurRadius: 0.4,
                                            offset: Offset(0, 4))
                                      ]),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                              "assets/icons8-vegan-food-64 1.png"),
                                          Text("LOG CALORIES",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'RopaSans',
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                // ),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              LogCalories()));
                                },
                              ),
                            ),
                            SizedBox(
                              width:
                                  (MediaQuery.of(context).size.width * 0.8) / 2,
                              height:
                                  (MediaQuery.of(context).size.width * 0.8) / 2,
                              child: MaterialButton(
                                padding: EdgeInsets.all(0),
                                textColor: Colors.white,
                                splashColor: Colors.greenAccent,
                                // elevation: 8.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: Container(
                                  // width: 200,
                                  // height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      gradient: LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            Color(0xff5CCB88),
                                            Color(0xffF55E61)
                                          ]),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0xfff48d7b)
                                                .withOpacity(0.7),
                                            blurRadius: 0.4,
                                            offset: Offset(0, 4))
                                      ]),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                              "assets/icons8-biceps-48 1.png"),
                                          Text("LOG WORKOUTS",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'RopaSans',
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                // ),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              LogWorkout()));
                                },
                              ),
                            ),
                          ])),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Container(
                      width: (MediaQuery.of(context).size.width * 0.8) + 20,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              width:
                                  (MediaQuery.of(context).size.width * 0.8) / 2,
                              height:
                                  (MediaQuery.of(context).size.width * 0.8) / 2,
                              child: MaterialButton(
                                padding: EdgeInsets.all(0),
                                textColor: Colors.white,
                                splashColor: Colors.greenAccent,
                                // elevation: 8.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: Container(
                                  // width: 200,
                                  // height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      gradient: LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            Color(0xff5CCB88),
                                            Color(0xffF55E61)
                                          ]),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0xfff48d7b)
                                                .withOpacity(0.7),
                                            blurRadius: 0.4,
                                            offset: Offset(0, 4))
                                      ]),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                              "assets/icons8-inspection-64 1.png"),
                                          Text("CHECKLIST",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'RopaSans',
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                // ),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              ChecklistScreen()));
                                },
                              ),
                            ),
                            SizedBox(
                              width:
                                  (MediaQuery.of(context).size.width * 0.8) / 2,
                              height:
                                  (MediaQuery.of(context).size.width * 0.8) / 2,
                              child: MaterialButton(
                                padding: EdgeInsets.all(0),
                                textColor: Colors.white,
                                splashColor: Colors.greenAccent,
                                // elevation: 8.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: Container(
                                  // width: 200,
                                  // height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      gradient: LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            Color(0xff5CCB88),
                                            Color(0xffF55E61)
                                          ]),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0xfff48d7b)
                                                .withOpacity(0.7),
                                            blurRadius: 0.4,
                                            offset: Offset(0, 4))
                                      ]),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                              "assets/icons8-shop-64 1.png"),
                                          Text("SHOP",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'RopaSans',
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                // ),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              ShopScreen()));
                                },
                              ),
                            ),
                          ])),
                ),
              ])),
        ));
  }

  // TODO: add the _scan, _update, and _lookup methods
  _update() async {
    if (_key != null && _value != null) {
      AtKey pair = AtKey();
      pair.key = _key;
      pair.sharedWith = atSign;
      await _atClientService.put(pair, _value);
    }
  }

  _scan() async {
    List<String> response = await _atClientService.getKeys(sharedBy: atSign);
    if (response.length > 0) {
      List<String> scanList = response
          .map((key) => key
              .replaceAll('.' + conf.namespace + atSign, '')
              .replaceAll(atSign + ':', ''))
          .toList();
      setState(() {
        _scanItems = scanList;
      });
    }
  }

  _lookup() async {
    if (_lookupKey != null) {
      AtKey lookup = AtKey();
      lookup.key = _lookupKey;
      lookup.sharedWith = atSign;
      String response = await _atClientService.get(lookup);
      if (response != null) {
        setState(() {
          _lookupValue = response;
        });
      }
    }
  }
}
