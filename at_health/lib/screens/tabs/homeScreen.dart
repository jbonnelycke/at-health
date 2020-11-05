import 'package:flutter/material.dart';

Widget HomeScreenTab() {
  return Column(
    children: [
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
                        print('Tapped');
                      },
                    ))),
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
                        print('Tapped');
                      },
                    )))
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
                        print('Tapped');
                      },
                    ))),
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
                        print('Tapped');
                      },
                    )))
          ])),
    ],
  );
}
