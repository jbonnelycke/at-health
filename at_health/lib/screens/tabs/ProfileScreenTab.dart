// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:health/screens/MedCardScreen.dart';

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
