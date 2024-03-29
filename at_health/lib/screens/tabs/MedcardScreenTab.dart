import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:at_commons/at_commons.dart';
import 'package:health/components/HealthBar.dart';
import 'package:health/screens/login_screen.dart';
import 'package:health/screens/tabs/profile_screen.dart';
import 'package:health/services/server_demo_service.dart';
import 'package:health/screens/home_screen.dart';

// import 'login_screen.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class MedCardScreen extends StatefulWidget {
  static final String id = 'medcard';

  final PageController controller;

  MedCardScreen({PageController controller}) : this.controller = controller;

  @override
  _MedCardScreenState createState() => _MedCardScreenState(controller);
}

class _MedCardScreenState extends State<MedCardScreen> {
  _MedCardScreenState(this.controller);

  final PageController controller;

  String _nameValue;
  String _addressValue;
  String _contactValue;
  String _dobValue;
  String _heightValue;
  String _weightValue;
  String _providerValue;
  String _groupIDValue;
  String _memberIDValue;
  String _immunizationValue;
  String _allergyValue;

  // lookup
  TextEditingController _lookupNameTextFieldController = TextEditingController();
  TextEditingController _lookupAddressTextFieldController = TextEditingController();
  TextEditingController _lookupContactTextFieldController = TextEditingController();
  TextEditingController _lookupDOBTextFieldController = TextEditingController();
  TextEditingController _lookupHeightTextFieldController = TextEditingController();
  TextEditingController _lookupWeightTextFieldController = TextEditingController();
  TextEditingController _lookupProviderTextFieldController = TextEditingController();
  TextEditingController _lookupMemberIDTextFieldController = TextEditingController();
  TextEditingController _lookupGroupIDTextFieldController = TextEditingController();
  TextEditingController _lookupImmunizationTextFieldController = TextEditingController();
  TextEditingController _lookupAllergyTextFieldController = TextEditingController();

  // service
  ServerDemoService _atClientService = ServerDemoService.getInstance();

  @override
  void initState() {
    super.initState();
    // _atClientService.initClient(atSign);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            // backgroundColor: Colors.transparent,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                // color: Colors.blue.withOpacity(0.5),

                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xffFFD4A9), Color(0xffFFBF90)])),
            // color: Colors.transparent,
            child: Column(children: [
              Container(
                child: TextButton(
                    onPressed: () => {controller.jumpToPage(0)},
                    child: Text("< Back")),
              ),
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
                      // child: Container(
                      //     width: 90.0,
                      //     height: 90.0,
                      //     decoration: BoxDecoration(
                      //         shape: BoxShape.circle,
                      //         image: DecorationImage(
                      //           fit: BoxFit.fill,
                      //           image: ExactAssetImage('assets/user.png'),
                      //         ))),
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
                            borderRadius: new BorderRadius.circular(18.0)),
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
                            borderRadius: new BorderRadius.circular(18.0)),
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
                            // SnackBar mySnackbar =
                            //     SnackBar(content: Text("Hello $onValue"));
                            // Scaffold.of(context).showSnackBar(mySnackbar);
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
                            borderRadius: new BorderRadius.circular(18.0)),
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
                            // SnackBar mySnackbar =
                            //     SnackBar(content: Text("Hello $onValue"));
                            // Scaffold.of(context).showSnackBar(mySnackbar);
                          });
                        },
                      ),
                    ),
                  )),
            ])));
  }

  Future<String> createPersonalAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0)),
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
                    decoration: InputDecoration(hintText: 'Name'),
                    onChanged: (value) {
                      _nameValue = value;
                    },
                  ),
                  TextField(
                    controller: _lookupAddressTextFieldController,
                    decoration: InputDecoration(hintText: 'Address'),
                    onChanged: (value) {
                      _addressValue = value;
                    },
                  ),
                  TextField(
                    controller: _lookupContactTextFieldController,
                    decoration: InputDecoration(hintText: 'Emergency Contact'),
                    onChanged: (value) {
                      _contactValue = value;
                    },
                  ),
                  TextField(
                    controller: _lookupDOBTextFieldController,
                    decoration: InputDecoration(hintText: 'D.O.B.'),
                    onChanged: (value) {
                      _dobValue = value;
                    },
                  ),
                  TextField(
                    controller: _lookupHeightTextFieldController,
                    decoration: InputDecoration(hintText: 'Height'),
                    onChanged: (value) {
                      _heightValue = value;
                    },
                  ),
                  TextField(
                    controller: _lookupWeightTextFieldController,
                    decoration: InputDecoration(hintText: 'Weight'),
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
                          _lookupNameTextFieldController.text =
                              result.toString();
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
                          _lookupDOBTextFieldController.text =
                              result.toString();
                        });
                      });
                      _lookup("height").then((String result) {
                        setState(() {
                          _lookupHeightTextFieldController.text =
                              result.toString();
                        });
                      });
                      _lookup("weight").then((String result) {
                        setState(() {
                          _lookupWeightTextFieldController.text =
                              result.toString();
                        });
                      });
                    }),
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
                      Navigator.of(context)
                          .pop(customController.text.toString());
                      _lookupNameTextFieldController.text = '';
                      _lookupAddressTextFieldController.text = '';
                      _lookupContactTextFieldController.text = '';
                      _lookupDOBTextFieldController.text = '';
                      _lookupHeightTextFieldController.text = '';
                      _lookupWeightTextFieldController.text = '';
                    }),
              ]);
        });
  }

  Future<String> createInsureAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0)),
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
                    controller: _lookupProviderTextFieldController,
                    decoration: InputDecoration(hintText: 'provider'),
                    onChanged: (value) {
                      _providerValue = value;
                    },
                  ),
                  TextField(
                    controller: _lookupGroupIDTextFieldController,
                    decoration: InputDecoration(hintText: 'groupID'),
                    onChanged: (value) {
                      _groupIDValue = value;
                    },
                  ),
                  TextField(
                    controller: _lookupMemberIDTextFieldController,
                    decoration: InputDecoration(hintText: 'memberID'),
                    onChanged: (value) {
                      _memberIDValue = value;
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
                      _lookup("provider").then((String result) {
                        setState(() {
                          _lookupProviderTextFieldController.text =
                              result.toString();
                        });
                      });
                      _lookup("groupID").then((String result) {
                        setState(() {
                          _lookupGroupIDTextFieldController.text =
                              result.toString();
                        });
                      });
                      _lookup("memberID").then((String result) {
                        setState(() {
                          _lookupMemberIDTextFieldController.text =
                              result.toString();
                        });
                      });
                    }),
                MaterialButton(
                    elevation: 5.0,
                    child: Text('Update'),
                    onPressed: () {
                      _update("provider", _providerValue);
                      _update("groupID", _groupIDValue);
                      _update("memberID", _memberIDValue);
                      Navigator.of(context)
                          .pop(customController.text.toString());
                      _lookupProviderTextFieldController.text = '';
                      _lookupGroupIDTextFieldController.text = '';
                      _lookupMemberIDTextFieldController.text = '';
                    }),
              ]);
        });
  }

  Future<String> createImmuneAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0)),
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
                    controller: _lookupImmunizationTextFieldController,
                    decoration: InputDecoration(hintText: 'immunizations'),
                    onChanged: (value) {
                      _immunizationValue = value;
                    },
                  ),
                  TextField(
                    controller: _lookupAllergyTextFieldController,
                    decoration: InputDecoration(hintText: 'allergies'),
                    onChanged: (value) {
                      _allergyValue = value;
                    },
                  )
                ],
              ),
              actions: <Widget>[
                MaterialButton(
                    elevation: 5.0,
                    child: Text('Show Current Values'),
                    onPressed: () {
                      //_lookupValue = '
                      _lookup("immunizations").then((String result) {
                        setState(() {
                          _lookupImmunizationTextFieldController.text =
                              result.toString();
                        });
                      });
                      _lookup("allergies").then((String result) {
                        setState(() {
                          _lookupAllergyTextFieldController.text =
                              result.toString();
                        });
                      });
                    }),
                MaterialButton(
                    elevation: 5.0,
                    child: Text('Update'),
                    onPressed: () {
                      _update("immunizations", _immunizationValue);
                      _update("allergies", _allergyValue);
                      Navigator.of(context)
                          .pop(customController.text.toString());
                      _lookupImmunizationTextFieldController.text = '';
                      _lookupAllergyTextFieldController.text = '';
                    }),
              ]);
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

  // Potential Upgrade to above creating poll
}
