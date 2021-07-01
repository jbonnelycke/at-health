import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:at_commons/at_commons.dart';
// import 'package:health/screens/profile_screen.dart';
import 'package:health/services/server_demo_service.dart';
import 'package:health/screens/home_screen.dart';
import '../utils/at_conf.dart' as conf;
import 'login_screen.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class ShopScreen extends StatefulWidget {
  static final String id = 'shop';

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
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

  var shopCard = Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Container(
          height: 180,
          child: Stack(children: <Widget>[
            Container(
                height: 160,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(0, 1.5),
                      radius: 1.6,
                      colors: [Color(0xfff55e61), Color(0xff5ccb88)],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xfff5917d).withOpacity(1),
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset: Offset(0, 4))
                    ]),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/health_logo.png',
                        height: 64,
                        width: 64,
                        color: Colors.white38,
                      ),
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                      child: Text("Title",
                                          style: TextStyle(
                                            color: Color(0xffffdfb6),
                                            fontSize: 24,
                                          )),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                      child: Text(
                                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veni",
                                          style: TextStyle(
                                            color: Color(0xffffdfb6),
                                            fontSize: 12,
                                          )),
                                    ),
                                    Flexible(
                                        child: Container(
                                      width: double.infinity,
                                      child: Text("\$99.99",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xffffdfb6),
                                            fontSize: 24,
                                          )),
                                    ))
                                  ])))
                    ])),
            Positioned(
                bottom: 0,
                right: 5,
                child: RaisedButton(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    onPressed: () => {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        side: BorderSide(color: Color(0xfff55e61))),
                    color: Color(0xfff55e61),
                    textColor: Colors.white,
                    child: Text("View",
                        style: TextStyle(fontSize: 16, color: Colors.white))))
          ])));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  colors: [Color(0xfff55e61), Color(0xffFFE4BC)]),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3))
              ]),
          child: Column(children: [
            Container(
                margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                height: 80,
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Image.asset("./assets/health_logo.png")]),
                    ),
                    Positioned(
                        top: 5,
                        right: 10,
                        child: ButtonTheme(
                            minWidth: 32,
                            height: 32,
                            child: RaisedButton(
                                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              HomeScreen()));
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    side: BorderSide(color: Color(0xfff55e61))),
                                color: Color(0xfff55e61),
                                textColor: Colors.white,
                                child: Text("<Close>",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white))))),
                  ],
                )),
            Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 4))
                ]),
                child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Search for a product . . .",
                        contentPadding: EdgeInsets.fromLTRB(14, 0, 14, 0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide.none)))),
            Expanded(
                child: Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: new ListView(children: <Widget>[
                      shopCard,
                      shopCard,
                      shopCard,
                      shopCard
                    ])))
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
    List<AtKey> response = await _atClientService.getAtKeys(sharedBy: atSign);
    if (response.length > 0) {
      List<String> scanList =
      response.map((atKey) => atKey.key).toList();
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
