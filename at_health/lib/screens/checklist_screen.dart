import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:at_commons/at_commons.dart';
import 'package:health/screens/home_screen.dart';
import 'package:health/services/server_demo_service.dart';
import '../utils/at_conf.dart' as conf;
import 'login_screen.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ChecklistScreen extends StatefulWidget {
  static final String id = 'checklist';

  @override
  _ChecklistScreenState createState() => _ChecklistScreenState();
}


class _ChecklistScreenState extends State<ChecklistScreen> {
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


  var addButton = Positioned(
      bottom : 5,
      right : 5,
      child : ButtonTheme(
          minWidth : 64,
          height : 64,
          child : RaisedButton(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              onPressed: () => {},
              shape : RoundedRectangleBorder(
                  borderRadius : BorderRadius.circular(40),
                  side : BorderSide(color : Color(0xfff55e61))
              ),
              color : Color(0xfff55e61),
              textColor: Colors.white,
              child : Text("+",
                  style : TextStyle(
                      fontSize : 24,
                      color: Colors.white
                  )
              )
          )
      )
  );


  var checklistItem = Container(
      height : 60,
      margin: EdgeInsets.fromLTRB(0,0,0,15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.7, 2.0),
            radius : 3.0,
            colors: [
              Color(0xffffbe8f),
              Color(0xfff55e61)
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(6)),
          boxShadow : [
            BoxShadow(
                color : Colors.black.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 4,
                offset : Offset(0, 2)
            )
          ]
      ),
    child : Row(
      children: [
        Container(
          width : 20,
          height : 20,
          margin : EdgeInsets.fromLTRB(0, 0, 10, 0),
          decoration: BoxDecoration(
            color:  Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(2)),
              boxShadow : [
                BoxShadow(
                    color : Colors.black.withOpacity(0.4),
                    spreadRadius: -2,
                    blurRadius: 4,
                    offset : Offset(2, 2)
                )
              ]
          ),
        ),
        Text("Item",
            style : TextStyle(
                fontSize : 14,
                color: Colors.white
            )
        ),
      ],
    )
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.center,
                      colors: [Color(0xfff55e61), Color(0xffFFE4BC)]
                  ),
                  boxShadow : [
                    BoxShadow(
                        color : Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset : Offset(0, 3)
                    )
                  ]
              ),
              child: Column(
                  children: [
                    Container(
                        margin : EdgeInsets.fromLTRB(0, 0, 0, 0),
                        height : 150,
                        width : double.infinity,
                        child : Stack(
                          children: <Widget>[
                            Container(
                              padding : EdgeInsets.fromLTRB(10, 35, 10, 10),
                              color : Color(0xff5ccb88),
                              width : double.infinity,
                              height : 120,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children : [
                                      Text("My Checklists",
                                          style : TextStyle(
                                              fontSize : 26,
                                              color: Colors.white
                                          )
                                      ),
                                      Text("To Dos, Reminders, and More",
                                          style : TextStyle(
                                              fontSize : 12,
                                              color: Colors.white
                                          )
                                      )
                                  ]
                              ),
                            ),
                            Positioned(
                                top : 25,
                                right : 10,
                                child : ButtonTheme(
                                    minWidth : 32,
                                    height : 32,
                                    child : RaisedButton(
                                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                        onPressed: () {
                                          Navigator.of(context).pushReplacement(
                                              new MaterialPageRoute(
                                                  builder: (BuildContext context) =>
                                                      HomeScreen()));
                                        },
                                        shape : RoundedRectangleBorder(
                                            borderRadius : BorderRadius.circular(40),
                                            side : BorderSide(color : Color(0xfff55e61))
                                        ),
                                        color : Color(0xfff55e61),
                                        textColor: Colors.white,
                                        child : Text("X",
                                            style : TextStyle(
                                                fontSize : 12,
                                                color: Colors.white
                                            )
                                        )
                                    )
                                )
                            ),
                            addButton
                          ],
                        )
                    ),
                    Container(
                        margin : EdgeInsets.fromLTRB(0,5,0,0),
                        child:CarouselSlider(
                            options: CarouselOptions(
                                height : 220,
                                initialPage: 0,
                                aspectRatio: 16/9,
                                viewportFraction: 0.8,
                                enlargeCenterPage : true,
                                scrollDirection: Axis.horizontal
                            ),
                            items: [1, 2, 3, 4, 5].map((i) {
                              return Builder(
                                  builder : (BuildContext context) {
                                    return Container(
                                      margin : EdgeInsets.fromLTRB(0, 0, 0, 10),
                                      padding : EdgeInsets.all(10),
                                      width : double.infinity,
                                      height : 160,
                                      decoration: BoxDecoration(
                                          gradient: RadialGradient(
                                            center: Alignment(0.2, 2.0),
                                            radius : 1.4,
                                            colors: [
                                              Color(0xfff55e61),
                                              Color(0xff5ccb88)
                                            ],
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(6)),
                                          boxShadow : [
                                            BoxShadow(
                                                color : Colors.black.withOpacity(0.4),
                                                spreadRadius: 1,
                                                blurRadius: 4,
                                                offset : Offset(0, 4)
                                            )
                                          ]
                                      ),
                                      child : Text("Checklist $i",
                                          style : TextStyle(
                                              fontSize : 16,
                                              color: Colors.white
                                          )
                                      ),
                                    );
                                  }
                              );
                            }).toList()
                        ),

                    ),
                    Expanded(
                        child: Container(
                            padding : EdgeInsets.fromLTRB(20, 0, 20, 10),

                            child : new ListView(
                                children : <Widget>[
                                  checklistItem,
                                  checklistItem,
                                  checklistItem,
                                  checklistItem,
                                  checklistItem,
                                  checklistItem,
                                  checklistItem,
                                ]
                            )
                        )
                    )
                  ]
              )
          ),
        )
    );
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
