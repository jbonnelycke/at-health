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
  List<Exercise> cardioList = List<Exercise>();
  List<Exercise> upperBodyList = List<Exercise>();
  List<Exercise> lowerBodyList = List<Exercise>();

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
                child: Text('Create log'),
                onPressed: () {
                  // print(exercise.toString());
                  // print(_timed);
                  exercise.timed = _timed;
                  print(exercise.timed);
                  print({
                    "name": exercise.name,
                    "reps": exercise.reps,
                    "sets": exercise.sets,
                    "timed": exercise.timed,
                    "duration": exercise.duration,
                    "target": exercise.target,
                    // ""
                  });
                  exercise.target = target;
                  setState(() {
                    switch (exercise.target) {
                      case Target.Cardio:
                        cardioList.insert(0, exercise);
                        break;
                      case Target.Lower_Body:
                        lowerBodyList.insert(0, exercise);
                        break;
                      case Target.Upper_Body:
                        upperBodyList.insert(0, exercise);
                        break;
                      default:
                        throw ('Something Broke');
                    }
                    ;
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
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(135, 0, 0, 0),
          child: Row(
            children: [
              Image.asset('assets/health_logo.png'),
              new Spacer(),
              ButtonTheme(
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
                          style:
                              TextStyle(fontSize: 12, color: Colors.white)))),
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
              children: [
                // Text('Yes'),
                //Header Component
                Container(
                  height: 220,
                  decoration: BoxDecoration(
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
                    padding: const EdgeInsets.all(12.0),
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
                                    img: Image.asset('/assets/fire.png'),
                                    header: 'Yes',

                                    // sub: 'yup',
                                  )),
                                  Expanded(
                                      child: GoalElem(
                                    header: 'Yes',
                                  )),
                                  Expanded(
                                      child: GoalElem(
                                    header: 'Junior',
                                  )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ButtonTheme(
                  minWidth: 50,
                  height: 50,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Color(0xff54B87C),
                    onPressed: () {
                      createWorkoutDialog(context).then((onValue) {
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
                TextButton(
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(20)),
                    // color: Color(0xff5CCB88),
                    style: TextButton.styleFrom(
                        backgroundColor: Color(0xff5CCB88),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        minimumSize: Size(100, 50)),
                    onPressed: () {
                      print('This works :D');
                      createWorkoutDialog(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        'Add Exercise',
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'RopaSans',
                            color: Color(0xffFFE4BC)),
                      ),
                    )),
                Container(
                  // width: 300,
                  // height: MediaQuery.of(context).size.height * 0.7,

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
                  child: WorkoutDisplay(
                    title: 'Cardio',
                    arr: cardioList,
                    direction: direction,
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
  final String sub = "Yup";
  GoalElem({this.header, this.img});

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
        Text(header, style: TextStyle(fontSize: 20)),
        Text(sub)
      ],
    );
  }
}

class WorkoutDisplay extends StatefulWidget {
  final String title;
  final List<Exercise> arr;
  final Axis direction;

  WorkoutDisplay(
      {@required this.title, @required this.arr, @required this.direction});

  @override
  _WorkoutDisplayState createState() => _WorkoutDisplayState();
}

class _WorkoutDisplayState extends State<WorkoutDisplay> {
  List<Widget> generateElems() {
    List<Exercise> temp = widget.arr;
    List<Widget> elems = [];
    for (int i = 0; i < 3; i++) {
      try {
        elems.add(ExerciseElem(
          exercise: temp[i],
        ));
      } on RangeError catch (e) {
        elems.add(Container(height: 30));
      }
    }
    print(elems);
    return elems;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('${widget.title} is rerendering!!!');
    print("This the direction: ${widget.direction}");
    bool _show = false;
    bool _expanded = widget.direction == Axis.horizontal;
    if (widget.arr.length >= 3) {
      _show = true;
    }
    print(MediaQuery.of(context).size.height * 0.6);
    return Container(
      // height: _expanded ? MediaQuery.of(context).size.height * 0.8 : 165,
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Color(0xffFEBE92),
          // border: Border.all(
          //   color: Color(0xffF55E61),
          // ),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Stack(
            children: [
              Visibility(
                visible: _show & _expanded,
                child: Positioned(
                  top: 0,
                  child: Text(
                    "100",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              Column(
                // physics: ,
                // children: widget.arr
                //     .map((elem) => ExerciseElem(
                //           exercise: elem,
                //         ))
                //     .toList()
                children: generateElems(),
              ),
              Visibility(
                visible: _show & !_expanded,
                child: Positioned(
                  bottom: 0,
                  child: Text(
                    "100",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
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
