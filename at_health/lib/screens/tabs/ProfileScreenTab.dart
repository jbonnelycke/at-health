// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:health/screens/MedCardScreen.dart';

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

Widget ProfileScreenTab(BuildContext context) {
  return Column(
      children: [
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


      ]);
}
  createMedCardAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();

    return showDialog(context: context, builder: (context) {
      return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0)
          ),
          backgroundColor: Color(0xffFFD4A9),
          title: Text(
            'MedCard',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'RopaSans',
                fontWeight: FontWeight.bold,
                color: Colors.red),
          ),
          content: Column(children: [

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
                )
              ],
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
                        createInsureAlertDialog(context).then((onValue) {
                          SnackBar mySnackbar = SnackBar(
                              content: Text("Hello $onValue"));
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
                        createImmuneAlertDialog(context).then((onValue) {
                          SnackBar mySnackbar = SnackBar(
                              content: Text("Hello $onValue"));
                          Scaffold.of(context).showSnackBar(mySnackbar);
                        });
                      },
                    ),
                  ),
                )),
          ]
          ),
          actions: <Widget>[
            MaterialButton(
                elevation: 5.0,
                child: Text('Show Current Values'),
                onPressed: () {
                  //_lookupValue = '
                  _lookup("name").then((String result) {
                    setState(() {
                      _lookupNameTextFieldController.text = result.toString();
                    });
                  });
                  _lookup("address").then((String result) {
                    setState(() {
                      _lookupAddressTextFieldController.text =
                          result.toString();
                    });
                  });
                  _lookup("contact").then((String result) {
                    setState(() {
                      _lookupContactTextFieldController.text =
                          result.toString();
                    });
                  });
                  _lookup("dob").then((String result) {
                    setState(() {
                      _lookupDOBTextFieldController.text = result.toString();
                    });
                  });
                  _lookup("height").then((String result) {
                    setState(() {
                      _lookupHeightTextFieldController.text = result.toString();
                    });
                  });
                  _lookup("weight").then((String result) {
                    setState(() {
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
            )
            ,
          ]
      );
    });
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
                      _lookupNameTextFieldController.text = result.toString();
                    });
                  });
                  _lookup("address").then((String result) {
                    setState(() {
                      _lookupAddressTextFieldController.text =
                          result.toString();
                    });
                  });
                  _lookup("contact").then((String result) {
                    setState(() {
                      _lookupContactTextFieldController.text =
                          result.toString();
                    });
                  });
                  _lookup("dob").then((String result) {
                    setState(() {
                      _lookupDOBTextFieldController.text = result.toString();
                    });
                  });
                  _lookup("height").then((String result) {
                    setState(() {
                      _lookupHeightTextFieldController.text = result.toString();
                    });
                  });
                  _lookup("weight").then((String result) {
                    setState(() {
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
      if (response != null) {
        return response;
      }
      return "not found";
    }
  }
}
