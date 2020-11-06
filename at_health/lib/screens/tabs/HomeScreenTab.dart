// import 'dart:html';

import 'package:flutter/material.dart';

Widget HomeScreenTab(BuildContext context) {
  return Column(
    children: [
      Container(
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
      ),
      Container(
          width: (MediaQuery.of(context).size.width * 0.8) + 20,
          margin: EdgeInsets.only(bottom: 20.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: (MediaQuery.of(context).size.width * 0.8) / 2,
                  height: (MediaQuery.of(context).size.width * 0.8) / 2,
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
                              colors: [Color(0xff5CCB88), Color(0xffF55E61)]),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xfff48d7b).withOpacity(0.7),
                                blurRadius: 0.4,
                                offset: Offset(0, 4))
                          ]),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/icons8-vegan-food-64 1.png"),
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
                      print('Tapped');
                    },
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width * 0.8) / 2,
                  height: (MediaQuery.of(context).size.width * 0.8) / 2,
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
                              colors: [Color(0xff5CCB88), Color(0xffF55E61)]),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xfff48d7b).withOpacity(0.7),
                                blurRadius: 0.4,
                                offset: Offset(0, 4))
                          ]),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/icons8-biceps-48 1.png"),
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
                      print('Tapped');
                    },
                  ),
                ),
              ])),
      Container(
          width: (MediaQuery.of(context).size.width * 0.8) + 20,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: (MediaQuery.of(context).size.width * 0.8) / 2,
                  height: (MediaQuery.of(context).size.width * 0.8) / 2,
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
                              colors: [Color(0xff5CCB88), Color(0xffF55E61)]),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xfff48d7b).withOpacity(0.7),
                                blurRadius: 0.4,
                                offset: Offset(0, 4))
                          ]),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/icons8-inspection-64 1.png"),
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
                      print('Tapped');
                    },
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width * 0.8) / 2,
                  height: (MediaQuery.of(context).size.width * 0.8) / 2,
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
                              colors: [Color(0xff5CCB88), Color(0xffF55E61)]),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xfff48d7b).withOpacity(0.7),
                                blurRadius: 0.4,
                                offset: Offset(0, 4))
                          ]),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/icons8-shop-64 1.png"),
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
                      print('Tapped');
                    },
                  ),
                ),
              ])),
    ],
  );
}
