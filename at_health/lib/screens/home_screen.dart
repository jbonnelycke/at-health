import 'dart:ui';
import 'package:flutter/material.dart';
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

class HomeScreen extends StatefulWidget {
  static final String id = 'home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
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
                            FlatButton(
                              child: Icon(Icons.home_rounded), //TODO
                              //color: Colors.blue,
                              onPressed: () {},
                            ),
                            FlatButton(
                              child: Icon(Icons.fitness_center_rounded),
                              //TODO
                              //color: Colors.blue,
                              onPressed: () {
                                /** */
                              },
                            ),
                            FlatButton(
                              child: Icon(Icons.insert_link_rounded),
                              //color: Colors.blue,
                              onPressed: () {
                                /** */
                              },
                            ),
                            FlatButton(
                              child: Icon(Icons.account_circle_outlined),
                              //color: Colors.blue,
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ProfileScreen()));
                              },
                            ),
                          ],
                        ))),
                Container(
                    width: 500,
                    height: 130,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 70, 0),
                      child: Text(
                        'What\'s up Doc?',
                        style: TextStyle(
                            fontSize: 50,
                            fontFamily: 'RopaSans',
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ))),
                Container(
                    width: 500,
                    height: 200,
                    child: Row(children: <Widget>[
                      Expanded(
                          child: SizedBox(
                              width: 250,
                              child: MaterialButton(
                                //padding: EdgeInsets.all(8.0),
                                textColor: Colors.white,
                                splashColor: Colors.greenAccent,
                                elevation: 8.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: Container(
                                  width: 145,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [Color(0xff5CCB88), Color(0xffF55E61)]),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(30, 60, 30, 60),
                                    child: Text("LOG CALORIES",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'RopaSans',
                                        )),
                                  ),
                                ),
                                // ),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              LogCalories()));
                                },
                              ))
                      ),
                      Expanded(
                          child: SizedBox(
                              width: 250,
                              child: MaterialButton(
                                //padding: EdgeInsets.all(8.0),
                                textColor: Colors.white,
                                splashColor: Colors.greenAccent,
                                elevation: 8.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: Container(
                                  width: 145,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [Color(0xff5CCB88), Color(0xffF55E61)]),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(30, 60, 30, 60),
                                    child: Text("LOG EXERCISE",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'RopaSans',
                                        )),
                                  ),
                                ),
                                // ),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              LogWorkout()));
                                },
                              ))
                      )
                    ])),
                Container(
                    width: 500,
                    height: 200,
                    child: Row(children: <Widget>[
                      Expanded(
                          child: SizedBox(
                              width: 250,
                              child: MaterialButton(
                                //padding: EdgeInsets.all(8.0),
                                textColor: Colors.white,
                                splashColor: Colors.greenAccent,
                                elevation: 8.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: Container(
                                  width: 145,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [Color(0xff5CCB88), Color(0xffF55E61)]),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(30, 60, 30, 60),
                                    child: Text("CHECKLIST",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'RopaSans',
                                        )),
                                  ),
                                ),
                                // ),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              ChecklistScreen()));
                                },
                              ))
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 250,
                          child: MaterialButton(
                        //padding: EdgeInsets.all(8.0),
                        textColor: Colors.white,
                        splashColor: Colors.greenAccent,
                        elevation: 8.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Container(
                          width: 145,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [Color(0xff5CCB88), Color(0xffF55E61)]),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(30, 60, 30, 60),
                            child: Text("SHOP",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'RopaSans',
                                )),
                          ),
                        ),
                        // ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ShopScreen()));
                        },
                      ))
                      )])),
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
