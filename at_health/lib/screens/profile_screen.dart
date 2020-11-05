import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:at_commons/at_commons.dart';
import 'package:health/services/server_demo_service.dart';
import 'package:health/screens/home_screen.dart';
import 'package:health/screens/medcard_screen.dart';
import '../utils/at_conf.dart' as conf;
import 'login_screen.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  static final String id = 'profile';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
    //_atClientService.initClient(atSign);
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
                      colors: [Color(0xff54B87C), Color(0xff54B87C)])),
              child: Column(
                children: [
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
                                onPressed: () {
                                  Navigator
                                      .of(context)
                                      .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
                                },
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
                                  /** */
                                },
                              ),
                            ],
                          ))),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Container(
                        width: 200.0,
                        height: 200.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: ExactAssetImage('assets/user.png'),
                            )
                        )),
                  ),
                  Container(
                      width: 500,
                      height: 130,
                      child: Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                            child: Text(
                              '@Profile',
                              style: TextStyle(
                                  fontSize: 50,
                                  fontFamily: 'RopaSans',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffDE3A3D)),
                            ),
                          ))),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: Container(
                        child: ButtonTheme(
                          minWidth: 375.0,
                          height: 50.0,
                          child: RaisedButton(
                            //padding: EdgeInsets.all(8.0),
                            textColor: Colors.white,
                            splashColor: Colors.greenAccent,
                            elevation: 8.0,
                            color: Color(0xffDE3A3D),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(90, 15, 90, 15),
                              child: Text("MY LOGS",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'RopaSans',
                                  )),
                            ),
                            onPressed: () {
                              print('Tapped');
                            },
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: Container(
                      child: ButtonTheme(
                        minWidth: 375.0,
                        height: 50.0,
                        child: RaisedButton(
                          //padding: EdgeInsets.all(8.0),
                          textColor: Colors.white,
                          splashColor: Colors.greenAccent,
                          elevation: 8.0,
                          color: Color(0xffDE3A3D),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0)
                          ),
                          child: Padding(
                          padding: const EdgeInsets.fromLTRB(90, 15, 90, 15),
                            child: Text("MY GROUPS",
                              style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'RopaSans',
                              )),
                        ),
                        onPressed: () {
                          print('Tapped');
                        },
                      ),
                    ),
                  )),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: Container(
                        child: ButtonTheme(
                          minWidth: 375.0,
                          height: 50.0,
                          child: RaisedButton(
                            //padding: EdgeInsets.all(8.0),
                            textColor: Colors.white,
                            splashColor: Colors.greenAccent,
                            elevation: 8.0,
                            color: Color(0xffDE3A3D),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(90, 15, 90, 15),
                              child: Text("MED CARD",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'RopaSans',
                                  )),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          MedCardScreen()));
                            },
                          ),
                        ),
                      )),


    ]))));
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
