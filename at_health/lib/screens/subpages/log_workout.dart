import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:health/constants.dart';
import 'package:health/data%20objects/exercise.dart';
import 'package:health/screens/home_screen.dart';
import 'package:health/data objects/enums.dart';

class LogWorkout extends StatefulWidget {
  static final String id = 'log workout';

  @override
  _LogWorkoutState createState() => _LogWorkoutState();
}

class _LogWorkoutState extends State<LogWorkout> {
  List<Exercise> exerciseList = List<Exercise>();
  int _goal = 0;
  int _calsBurned = 0;
  double _hoursSpent = 0;
  double _progress = 0;
  // List<Exercise> upperBodyList = List<Exercise>();
  // List<Exercise> lowerBodyList = List<Exercise>();
  Future<String> createGoalDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0)),
            backgroundColor: Color(0xffFFD4A9),
            title: Text(
              'Enter Calorie Intake Goal:',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RopaSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            ),
            content: TextField(
              controller: customController,
              keyboardType: TextInputType.number,
              cursorColor: AtHealth.red,
            ),
            actions: <Widget>[
              MaterialButton(
                color: AtHealth.red,
                elevation: 5.0,
                child: Text('Submit'),
                onPressed: () {
                  Navigator.of(context).pop(customController.text.toString());
                  //print(customController.text.toString());
                },
              ),
            ],
          );
        });
  }

  Future<Exercise> createWorkoutDialog(BuildContext context) {
    Exercise exercise = new Exercise();

    //Controllers
    TextEditingController nameController = TextEditingController();
    TextEditingController setController = TextEditingController();
    TextEditingController repsController = TextEditingController();
    TextEditingController durationController = TextEditingController();

    Target target = Target.Cardio;
    exercise.target = target;
    bool _timed = false;
    int index = 0;

    final changingController = {
      "hintText": ['reps', 'seconds per set'],
      "controllers": [repsController, durationController],
      "onChangedFn": [
        //repsController onChanged function
        (String val) {
          exercise.duration = 0;
          exercise.reps = int.parse(val);
        },
        //durationController onChanged function
        (String val) {
          exercise.reps = 0;
          exercise.duration = int.parse(val);
        },
      ],
    };

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0)),
            backgroundColor: Color(0xffFFD4A9),
            title: Text(
              'Exercise Log',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'RopaSans',
                  fontWeight: FontWeight.w300,
                  color: Colors.red),
            ),
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: Container(
                  height: 300,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        autofocus: true,
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: 'Name of Exercise',
                        ),
                        onChanged: (str) {
                          exercise.name = str;
                        },
                      ),
                      SwitchListTile(
                        title: const Text("Timed?"),
                        value: _timed,
                        onChanged: (val) {
                          setState(() {
                            print("This is timed $_timed");
                            _timed = val;
                            index = _timed ? 1 : 0;
                          });
                        },
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: setController,
                            decoration: InputDecoration(hintText: "Sets"),
                            onChanged: (str) {
                              exercise.sets = int.parse(str);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: changingController["controllers"]
                                [index],
                            decoration: InputDecoration(
                              hintText: changingController["hintText"][index],
                            ),
                            onChanged: changingController["onChangedFn"][index],
                            // enabled: !_timed,
                          ),
                        ),
                      ),
                      DropdownButton<Target>(
                        value: target,
                        onChanged: (Target n) {
                          exercise.target = n;
                          setState(() {
                            target = n;
                          });
                        },
                        items: Target.values
                            .map<DropdownMenuItem<Target>>((Target t) {
                          return DropdownMenuItem<Target>(
                            value: t,
                            child: Text(t
                                .toString()
                                .substring(7)
                                .replaceFirst('_', ' ')),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
              );
            }),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                color: AtHealth.red,
                child: Text('Create log'),
                onPressed: () {
                  // print(exercise.toString());
                  // print(_timed);
                  exercise.timed = _timed;
                  exercise.target = target;
                  setState(() {
                    exerciseList.insert(0, exercise);
                  });
                  Navigator.of(context).pop(exercise);
                },
              ),
            ],
          );
        });
  }

  Axis direction = Axis.vertical;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: GradientAppBar(
        centerTitle: true,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Stack(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(child: Image.asset('assets/health_logo.png')),
              // new Spacer(),
              Positioned(
                right: 0,
                child: ButtonTheme(
                    minWidth: 32,
                    height: 32,
                    child: RaisedButton(
                        padding: EdgeInsets.all(5),
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
                            style:
                                TextStyle(fontSize: 12, color: Colors.white)))),
              ),
            ],
          ),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xffF55E61), Color(0xffFFBE8F)],
        ),
      ),
      body: Builder(builder: (context) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffFFD4A9),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text('Yes'),
                //Header Component
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: AtHealth.red.withOpacity(0.6),
                            offset: Offset(0, -4),
                            blurRadius: 10,
                            spreadRadius: 7),
                      ],
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xffFFBE8F),
                            Color(0xffFFD4A9),
                            Color(0xffFFBE8F),
                          ]),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.share_rounded,
                              color: Colors.blue[200],
                              size: 40.0,
                            )),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                      child: GoalElem(
                                    img: Image.asset(
                                      'assets/fire.png',
                                      height: 70,
                                      width: 70,
                                    ),
                                    header: _calsBurned.toString(),
                                    sub: 'Calories Burned',
                                  )),
                                  Expanded(
                                      child: GoalElem(
                                          img: Image.asset(
                                            'assets/clock.png',
                                            width: 70,
                                            height: 70,
                                          ),
                                          header: _hoursSpent.toString(),
                                          sub: 'Hours')),
                                  Expanded(
                                      child: GoalElem(
                                          img: Image.asset(
                                            'assets/goal.png',
                                            width: 70,
                                            height: 70,
                                          ),
                                          header: _goal.toString(),
                                          sub: 'Burn Goal')),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('Progress',
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(fontSize: 26, color: AtHealth.green)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 30.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: LinearProgressIndicator(
                                value: _progress,
                                // minHeight: 20,
                                backgroundColor: AtHealth.secondaryColor,
                                valueColor: new AlwaysStoppedAnimation(
                                    Color(0xffF55E61)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      FlatButton(
                        minWidth: 200,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Color(0xff54B87C),
                        onPressed: () {
                          createGoalDialog(context).then((onValue) {
                            if (onValue != null) {
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
                              setState(() {
                                _goal = int.parse(onValue);
                                _progress = _calsBurned / _goal;
                              });
                            }
                          });
                        },
                        child: Text(
                          'Add Goal',
                          style: TextStyle(
                              fontSize: 20, color: AtHealth.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // width: 300,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.38,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AtHealth.red.withOpacity(0.6),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Color(0xffFEBE92),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  // child: ListView(
                  //   shrinkWrap: true,
                  //   physics: ClampingScrollPhysics(),
                  //   scrollDirection: direction,
                  //   children: [
                  //     WorkoutDisplay(
                  //       title: 'Cardio',
                  //       arr: cardioList,
                  //       direction: direction,
                  //     ),
                  //   ],
                  // ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          right: 10,
                          // width: 70,
                          // height: 70,
                          child: IconButton(
                            padding: EdgeInsets.all(0),
                            iconSize: 60,
                            icon: Icon(
                              Icons.add,
                              // size: 60.0,
                              color: AtHealth.red,
                              textDirection: TextDirection.ltr,
                            ),
                            onPressed: () {
                              if (_goal <= 0) {
                                SnackBar mySnackBar = SnackBar(
                                  content: Text(
                                      'You have to add your Burn Goal first. Click the Add Goal Button.',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'RopaSans',
                                      )),
                                  backgroundColor: AtHealth.red,
                                );
                                Scaffold.of(context).showSnackBar(mySnackBar);
                              } else {
                                createWorkoutDialog(context);
                              }
                            },
                          ),
                        ),
                        Column(
                          children: [
                            // Text(
                            //   "Your Exercises",
                            //   style: TextStyle(fontSize: 20),
                            // ),
                            Expanded(
                              child: WorkoutDisplay(
                                arr: exerciseList,
                                width: MediaQuery.of(context).size.width,
                                // direction: direction,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

class GoalElem extends StatelessWidget {
  final Image img;
  final String header;
  final String sub;
  GoalElem({this.header, this.img, this.sub});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 0,
          child: Container(
            width: 100,
            height: 100,
            child: Center(child: img),
            decoration: BoxDecoration(
              color: AtHealth.red,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
        Text(header, style: TextStyle(fontSize: 20, color: Color(0xffDE3A3D))),
        Text(sub)
      ],
    );
  }
}

class WorkoutDisplay extends StatefulWidget {
  final List<Exercise> arr;
  final double width;
  WorkoutDisplay({
    @required this.arr,
    this.width,
  });

  @override
  _WorkoutDisplayState createState() => _WorkoutDisplayState();
}

class _WorkoutDisplayState extends State<WorkoutDisplay> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      width: widget.width * 0.7,
      child: ListView(
        // physics: ,
        // children: widget.arr
        //     .map((elem) => ExerciseElem(
        //           exercise: elem,
        //         ))
        //     .toList()
        children: widget.arr
            .map((elem) => ExerciseElem(
                  exercise: elem,
                ))
            .toList(),
      ),
    );
  }
}

class ExerciseElem extends StatelessWidget {
  final Exercise exercise;
  ExerciseElem({this.exercise});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Center(
            child: Image.asset(
              'assets/goal.png',
              width: 40,
              height: 40,
            ),
          ),
        ),
        Expanded(
            child: Text(
          exercise.name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        )),
        Text('Yes')
      ],
    );
  }
}
