import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:health/screens/home_screen.dart';

class LogWorkout extends StatefulWidget {
  static final String id = 'log workout';

  @override
  _LogWorkoutState createState() => _LogWorkoutState();
}

class _LogWorkoutState extends State<LogWorkout> {
  Future<String> createAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0)),
            backgroundColor: Color(0xffFFD4A9),
            title: Text(
              'Enter Burn Calorie Goal:',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RopaSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            ),
            content: TextField(
              controller: customController,
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text('Submit'),
                onPressed: () {
                  Navigator.of(context).pop(customController.text.toString());
                },
              ),
            ],
          );
        });
  }

  Future<String> createWorkLogAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();
    TextEditingController customController2 = TextEditingController();
    TextEditingController setNumController = TextEditingController();
    TextEditingController repNumController = TextEditingController();
    TextEditingController timeTakenController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0)),
            backgroundColor: Color(0xffFFD4A9),
            title: Text(
              'Workout Log:',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RopaSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            ),
            content: Container(
              height: 100,
              child: Column(
                children: [
                  TextField(
                    controller: customController,
                    decoration: InputDecoration(
                      hintText: 'Category',
                    ),
                    onChanged: (str) {},
                  ),
                  TextField(
                    controller: customController2,
                    decoration: InputDecoration(
                      hintText: 'Exercise Name',
                    ),
                  ),
                  Row(children: [
                    TextField(
                      controller: setNumController,
                      decoration: InputDecoration(
                        hintText: 'Set #',
                      ),
                    ),
                    TextField(
                      controller: repNumController,
                      decoration: InputDecoration(
                        hintText: 'Rep #',
                      ),
                    ),
                    TextField(
                      controller: timeTakenController,
                      decoration: InputDecoration(
                        hintText: 'Time Taken',
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text('Create log'),
                onPressed: () {
                  Navigator.of(context).pop(customController.text.toString());
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(135, 0, 0, 0),
          child: Row(
            children: [
              Image.asset('assets/health_logo.png'),
              Padding(
                padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
                child: Positioned(
                    top: 25,
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
                            child: Text("X",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white))))),
              ),
            ],
          ),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xffF55E61), Color(0xffFFE4BC)],
        ),
      ),
      body: Builder(builder: (context) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xffFFD4A9), Color(0xffFFB57F)])),
            child: Column(
              children: [
                Center(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Daily Workout',
                    style: TextStyle(
                        fontSize: 36,
                        fontFamily: 'RopaSans',
                        fontWeight: FontWeight.bold,
                        color: Color(0xffDE3A3D)),
                  ),
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.share_rounded,
                          color: Colors.blue[200],
                          size: 40.0,
                        )),
                    SizedBox(
                      width: 200.0,
                    ),
                    Icon(
                      Icons.fireplace_rounded,
                      color: Colors.deepOrangeAccent[200],
                      size: 40.0,
                    ),
                    ButtonTheme(
                      minWidth: 50,
                      height: 50,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Color(0xff54B87C),
                        onPressed: () {
                          createAlertDialog(context).then((onValue) {
                            SnackBar mySnackBar = SnackBar(
                              content: Text(
                                  'Your diet goal has been set to $onValue calories!',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'RopaSans',
                                  )),
                              backgroundColor: Color(0xff54B87C),
                            );
                            Scaffold.of(context).showSnackBar(mySnackBar);
                          });
                        },
                        child: Text(
                          'Goal',
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cardio:',
                        style: TextStyle(
                            fontSize: 36,
                            fontFamily: 'RopaSans',
                            color: Color(0xff5CCB88)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Container(
                    height: 110,
                    width: 400,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: Color(0xffF55E61),
                        border: Border.all(
                          color: Color(0xffF55E61),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Upper Body:',
                        style: TextStyle(
                            fontSize: 36,
                            fontFamily: 'RopaSans',
                            color: Color(0xff5CCB88)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Container(
                    height: 110,
                    width: 400,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: Color(0xffF55E61),
                        border: Border.all(
                          color: Color(0xffF55E61),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Lower Body:',
                        style: TextStyle(
                            fontSize: 36,
                            fontFamily: 'RopaSans',
                            color: Color(0xff5CCB88)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Container(
                    height: 110,
                    width: 400,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Color(0xffF55E61),
                      border: Border.all(
                        color: Color(0xffF55E61),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 1.2),
                  child: ButtonTheme(
                    minWidth: 100,
                    height: 50,
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Color(0xff5CCB88),
                        onPressed: () {
                          createWorkLogAlertDialog(context);
                        },
                        child: Text(
                          'Add Exercise',
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'RopaSans',
                              color: Color(0xffFFE4BC)),
                        )),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
