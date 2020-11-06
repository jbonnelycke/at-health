import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:at_commons/at_commons.dart';
import 'package:health/screens/profile_screen.dart';
import 'package:health/services/server_demo_service.dart';
import 'package:health/screens/home_screen.dart';
import '../utils/at_conf.dart' as conf;
import 'login_screen.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class MedCardScreen extends StatefulWidget {
  static final String id = 'medcard';

  @override
  _MedCardScreenState createState() => _MedCardScreenState();
}

class _MedCardScreenState extends State<MedCardScreen> {

  String _nameValue;
  String _addressValue;
  String _contactValue;
  String _dobValue;
  String _heightValue;
  String _weightValue;


  // lookup
  TextEditingController _lookupNameTextFieldController = TextEditingController();
  TextEditingController _lookupAddressTextFieldController = TextEditingController();
  TextEditingController _lookupContactTextFieldController = TextEditingController();
  TextEditingController _lookupDOBTextFieldController = TextEditingController();
  TextEditingController _lookupHeightTextFieldController = TextEditingController();
  TextEditingController _lookupWeightTextFieldController = TextEditingController();

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
                                Navigator.of(context).pushReplacement(
                                    new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ProfileScreen()));
                              },
                            ),
                          ],
                        ))),
                Row(
                  children: [
                    Container(
                        width: 200,
                        height: 130,
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 40, 20),
                              child: Text(
                                'MedCard',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 40,
                                    fontFamily: 'RopaSans',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                            ))),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(115, 0, 0, 20),
                      child: Container(
                          width: 90.0,
                          height: 90.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: ExactAssetImage('assets/user.png'),
                              )
                          )),
                    ),
                  )],
                ),
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
                          color: Color(0xff5CCB88),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(90, 15, 90, 15),
                            child: Text("PERSONAL",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'RopaSans',
                                )),
                          ),
                          onPressed: () {
                            createPersonalAlertDialog(context);
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
                          color: Color(0xff5CCB88),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(90, 15, 90, 15),
                            child: Text("INSURANCE",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'RopaSans',
                                )),
                          ),
                          onPressed: () {
                            createInsureAlertDialog(context).then((onValue){
                              SnackBar mySnackbar = SnackBar(content: Text("Hello $onValue"));
                              Scaffold.of(context).showSnackBar(mySnackbar);
                            });
                          },
                        ),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: Container(
                      child: ButtonTheme(
                        minWidth: 375.0,
                        height: 65,
                        child: RaisedButton(
                          //padding: EdgeInsets.all(8.0),
                          textColor: Colors.white,
                          splashColor: Colors.greenAccent,
                          elevation: 8.0,
                          color: Color(0xff5CCB88),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(30, 15, 40, 15),
                            child: Text("IMMUNIZATIONS AND ALLERGIES",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'RopaSans',
                                )),
                          ),
                          onPressed: () {
                            createImmuneAlertDialog(context).then((onValue){
                              SnackBar mySnackbar = SnackBar(content: Text("Hello $onValue"));
                              Scaffold.of(context).showSnackBar(mySnackbar);
                            });
                          },
                        ),
                      ),
                    )),
              ])),
        ));
  }
  Future<String> createPersonalAlertDialog(BuildContext context) {

    TextEditingController customController = TextEditingController();

    return showDialog(context: context, builder: (context) {
      return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0)
          ),
        backgroundColor: Color(0xffFFD4A9),
        title: Text(
        'Personal',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 20,
            fontFamily: 'RopaSans',
            fontWeight: FontWeight.bold,
            color: Colors.red),
      ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _lookupNameTextFieldController,
              decoration: InputDecoration(
                hintText: 'Name'
              ),
              onChanged: (value) {
                _nameValue = value;
              },
            ),
            TextField(
                controller: _lookupAddressTextFieldController,
                decoration: InputDecoration(
                    hintText: 'Address'
                ),
              onChanged: (value) {
                _addressValue = value;
              },
            ),
            TextField(
                controller: _lookupContactTextFieldController,
                decoration: InputDecoration(
                    hintText: 'Emergency Contact'
                ),
              onChanged: (value) {
                _contactValue = value;
              },
            ),
            TextField(
                controller: _lookupDOBTextFieldController,
                decoration: InputDecoration(
                    hintText: 'D.O.B.'
                ),
              onChanged: (value) {
                _dobValue = value;
              },
            ),
            TextField(
                controller: _lookupHeightTextFieldController,
                decoration: InputDecoration(
                    hintText: 'Height'
                ),
              onChanged: (value) {
                _heightValue = value;
              },
            ),
            TextField(
                controller: _lookupWeightTextFieldController,
                decoration: InputDecoration(
                    hintText: 'Weight'
                ),
              onChanged: (value) {
                _weightValue = value;
              },
            ),
          ],
        ),
          actions: <Widget>[
            MaterialButton(
                elevation: 5.0,
                child: Text('Show Current Values'),
                onPressed: () {
                  //_lookupValue = '
                  _lookup("name").then((String result) {
                    setState(() {
                      print(result);
                      _lookupNameTextFieldController.text = result.toString();
                    });
                  });
                  _lookup("address").then((String result) {
                    setState(() {
                      print(result);
                      _lookupAddressTextFieldController.text = result.toString();
                    });
                  });
                  _lookup("contact").then((String result) {
                    setState(() {
                      print(result);
                      _lookupContactTextFieldController.text = result.toString();
                    });
                  });
                  _lookup("dob").then((String result) {
                    setState(() {
                      print(result);
                      _lookupDOBTextFieldController.text = result.toString();
                    });
                  });
                  _lookup("height").then((String result) {
                    setState(() {
                      print(result);
                      _lookupHeightTextFieldController.text = result.toString();
                    });
                  });
                  _lookup("weight").then((String result) {
                    setState(() {
                      print(result);
                      _lookupWeightTextFieldController.text = result.toString();
                    });
                  });
                }
            ),
            MaterialButton(
              elevation: 5.0,
              child: Text('Update'),
              onPressed: () {
                  _update("name", _nameValue);
                  _update("address", _addressValue);
                  _update("contact", _contactValue);
                  _update("dob", _dobValue);
                  _update("height", _heightValue);
                  _update("weight", _weightValue);
                Navigator.of(context).pop(customController.text.toString());
                _lookupNameTextFieldController.text = '';
                _lookupAddressTextFieldController.text = '';
                _lookupContactTextFieldController.text = '';
                _lookupDOBTextFieldController.text = '';
                _lookupHeightTextFieldController.text = '';
                _lookupWeightTextFieldController.text = '';
              }
            ),
          ]
      );
    });
  }

  Future<String> createInsureAlertDialog(BuildContext context) {

    TextEditingController customController = TextEditingController();

    return showDialog(context: context, builder: (context) {
      return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0)
          ),
          backgroundColor: Color(0xffFFD4A9),
          title: Text(
            'Insurance',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'RopaSans',
                fontWeight: FontWeight.bold,
                color: Colors.red),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: customController,
                  decoration: InputDecoration(
                      hintText: 'Provider'
                  )
              ),
              TextField(
                  controller: customController,
                  decoration: InputDecoration(
                      hintText: 'Group ID'
                  )
              ),
              TextField(
                  controller: customController,
                  decoration: InputDecoration(
                      hintText: 'Member ID'
                  )
              ),
            ],
          ),
          actions: <Widget>[
            MaterialButton(
                elevation: 5.0,
                child: Text('Update'),
                onPressed: () {
                  Navigator.of(context).pop(customController.text.toString());
                }
            )
          ]
      );
    });
  }

  Future<String> createImmuneAlertDialog(BuildContext context) {

    TextEditingController customController = TextEditingController();

    return showDialog(context: context, builder: (context) {
      return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0)
          ),
          backgroundColor: Color(0xffFFD4A9),
          title: Text(
            'Immunizations and Allergies',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'RopaSans',
                fontWeight: FontWeight.bold,
                color: Colors.red),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: customController,
                  decoration: InputDecoration(
                      hintText: 'Immunizations'
                  )
              ),
              TextField(
                  controller: customController,
                  decoration: InputDecoration(
                      hintText: 'Allergies'
                  )
              ),
            ],
          ),
          actions: <Widget>[
            MaterialButton(
                elevation: 5.0,
                child: Text('Update'),
                onPressed: () {
                  //_update;
                  Navigator.of(context).pop(customController.text.toString());
                }
            )
          ]
      );
    });
  }

  // TODO: add the _scan, _update, and _lookup methods
  _update(String key, String value) async {
    if (key != null && value != null) {
      AtKey pair = AtKey();
      pair.key = key;
      pair.sharedWith = atSign;
      await _atClientService.put(pair, value);
    }
  }

  Future<String> _lookup(String key) async {
    if (key != null) {
      AtKey lookup = AtKey();
      lookup.key = key;
      lookup.sharedWith = atSign;
      String response = await _atClientService.get(lookup);
      print(response);
      if (response != null) {
           return response;
      }
      return "not found";
    }
  }
}
