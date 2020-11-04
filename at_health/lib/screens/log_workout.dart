import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class LogWorkout extends StatefulWidget {
  static final String id = 'log workout';

  @override
  _LogWorkoutState createState() => _LogWorkoutState();
}

class _LogWorkoutState extends State<LogWorkout> {
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
                  colors: [Color(0xffFFD4A9), Color(0xffFFB57F)])),
          child:Column(
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
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.share_rounded,
                      color: Colors.blue[200],
                      size: 40.0,
                    )
                  ),
                  SizedBox(
                    width: 200.0,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.fireplace_rounded,
                        color: Colors.deepOrangeAccent[200],
                        size: 40.0,
                      )
                  ),
                  ButtonTheme(
                    minWidth: 50,
                    height: 50,
                    child: FlatButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        color: Color(0xff54B87C),
                        onPressed: (){} ,
                        child: Text(
                          'Goal',
                        ) ),
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
                  width:400,
                  decoration: BoxDecoration(
                      color: Color(0xffF55E61),
                      border: Border.all(
                        color: Color(0xffF55E61),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
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
                  width:400,
                  decoration: BoxDecoration(
                      color: Color(0xffF55E61),
                      border: Border.all(
                        color: Color(0xffF55E61),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
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
                  width:400,
                  decoration: BoxDecoration(
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
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      color: Color(0xff5CCB88),
                      onPressed: (){} ,
                      child: Text(
                        'Add Exercise',
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'RopaSans',
                            color: Color(0xffFFE4BC)),
                      ) ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
