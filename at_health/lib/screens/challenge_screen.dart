import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health/screens/tabs/ChallengeScreebTab.dart';
import 'package:flutter/widgets.dart';
import 'package:at_commons/at_commons.dart';
import 'package:health/screens/profile_screen.dart';
import 'package:health/screens/log_calories.dart';
import 'package:health/screens/log_workout.dart';
import 'package:health/screens/checklist_screen.dart';
import 'package:health/screens/shop_screen.dart';
import 'package:health/services/server_demo_service.dart';
import '../utils/at_conf.dart' as conf;
import 'login_screen.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health/screens/home_screen.dart';

class ChallengeScreen extends StatefulWidget {
  static final String id = 'home';

  @override
  _ChallengeScreenState createState() {
    return _ChallengeScreenState();
  }
}

class _ChallengeScreenState extends State<ChallengeScreen> {
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

  var _inProgressChallenges = <Map<String, dynamic>>[
    {
      'name': 'Girls get Gains part 4',
      'description': 'A new core',
      'totalChallenges': 20,
      'completeChallenges': 1,
      'timed': true,
    },
    {
      'name': 'Girls get Gains part 5',
      'description': 'The Pushups Strike Back',
      'totalChallenges': 20,
      'completeChallenges': 5,
      'timed': true,
    },
    {
      'name': 'Girls get Gains part 6',
      'description': 'Return of the swole thighs',
      'totalChallenges': 20,
      'completeChallenges': 5,
      'timed': true,
    },
  ];
  var _AvailableChallenges = <Map<String, dynamic>>[
    {
      'name': 'Girls get Gains part 1',
      'description': 'A new core',
      'totalChallenges': 20,
      'completeChallenges': 1,
      'timed': true,
    },
    {
      'name': 'Girls get Gains part 2',
      'description': 'The Pushups Strike Back',
      'totalChallenges': 20,
      'completeChallenges': 5,
      'timed': true,
    },
    {
      'name': 'Girls get Gains part 3',
      'description': 'Return of the swole thighs',
      'totalChallenges': 20,
      'completeChallenges': 5,
      'timed': true,
    },
  ];

  @override
  void initState() {
    super.initState();
  }

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
                        colors: [Color(0xffFFD4A9), Color(0xffFFBF90)])),
                child: Column(children: [
                  Container(
                      width: 500,
                      height: 125,
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          color: Color(0xff5CCB88),
                          child: ButtonBar(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                child: FlatButton(
                                  child: Icon(Icons.home_outlined, size: 50, color: Colors.black), //TODO
                                  //color: Colors.blue,
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                HomeScreen()));
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                child: FlatButton(
                                  child: Icon(Icons.fitness_center_outlined, size: 50, color: Colors.black),
                                  //TODO
                                  //color: Colors.blue,
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                ChallengeScreen()));
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                child: FlatButton(
                                  child: Icon(Icons.insert_link_outlined, size: 50, color: Colors.black),
                                  //color: Colors.blue,
                                  onPressed: () {
                                    /** */
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                child: FlatButton(
                                  child: Icon(Icons.account_circle_outlined, size: 50, color: Colors.black),
                                  //color: Colors.blue,
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                ProfileScreen()));
                                  },
                                ),
                              ),
                            ],
                          ))),
                  Column(children: <Widget>[
                    Container(
                        child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                "In-Progress",
                                style: TextStyle(
                                  color: Color(0xffDE3A3D),
                                  fontSize: 30.0,
                                ),
                              ),
                            ),
                            IconButton(
                                icon: Icon(
                                  CupertinoIcons.plus,
                                  color: Color(0xffDE3A3D),
                                  size: 35.0,
                                ),
                                onPressed: null)
                          ],
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 150.0,
                            aspectRatio: 2.0,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            initialPage: 0,
                          ),
                          items: _inProgressChallenges.map((i) {
                            print(i);
                            print(i.runtimeType);
                            // print(i["completeChallenges"].runtimeType);
                            // print(i["totalChallenges"].runtimeType);

                            double _doub =
                                i["completeChallenges"] / i["totalChallenges"];
                            print("Index is ${i["name"]}. Value is ${_doub}");

                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                    width: MediaQuery.of(context).size.width,
                                    // height: 200.0,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    decoration: BoxDecoration(
                                        // color: Colors.amber,
                                        gradient: RadialGradient(
                                          center: const Alignment(0.2, 1.7),
                                          // near the top right
                                          radius: 1.5,
                                          colors: [
                                            const Color(0xFFFB9B81),
                                            const Color(0xFF5ccb88),
                                            // yellow sun
                                            // const Color(0xFFFB9B81), // blue sky
                                          ],
                                          // stops: [0.5, 1.0],
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 10),
                                              width: 50.0,
                                              height: 10.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                color: Color(0xffFFE4BC),
                                              ),
                                            ),
                                            Container(
                                              width: 10.0,
                                              height: 10.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                color: Color(0xffFFE4BC),
                                              ),
                                            )
                                          ]),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Text(
                                              i["name"],
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                color: Color(0xffFFE4BC),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Text(
                                              i["description"],
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Color(0xffFFE4BC),
                                              ),
                                            ),
                                          ),
                                          Stack(children: [
                                            SizedBox(
                                              height: 20.0,
                                              child: LinearProgressIndicator(
                                                value: _doub.toDouble(),
                                                // minHeight: 20,
                                                backgroundColor:
                                                    Color(0xffFFE4BC),
                                                valueColor:
                                                    new AlwaysStoppedAnimation(
                                                        Color(0xffF55E61)),
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                "${i["completeChallenges"]} / ${i["totalChallenges"]}",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ])
                                        ],
                                      ),
                                    ));
                              },
                            );
                          }).toList(),
                        )
                      ],
                    )),
                    Container(
                        child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                "Available",
                                style: TextStyle(
                                  color: Color(0xffDE3A3D),
                                  fontSize: 30.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 150.0,
                            aspectRatio: 2.0,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            initialPage: 0,
                          ),
                          items: _AvailableChallenges.map((i) {
                            print(i);
                            print(i.runtimeType);
                            // print(i["completeChallenges"].runtimeType);
                            // print(i["totalChallenges"].runtimeType);

                            double _doub =
                                i["completeChallenges"] / i["totalChallenges"];
                            print("Index is ${i["name"]}. Value is ${_doub}");

                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                    width: MediaQuery.of(context).size.width,
                                    // height: 200.0,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    decoration: BoxDecoration(
                                        // color: Colors.amber,
                                        gradient: RadialGradient(
                                          center: const Alignment(0.2, 1.7),
                                          // near the top right
                                          radius: 1.5,
                                          colors: [
                                            const Color(0xFFFB9B81),
                                            const Color(0xFF5ccb88),
                                            // yellow sun
                                            // const Color(0xFFFB9B81), // blue sky
                                          ],
                                          // stops: [0.5, 1.0],
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 10),
                                              width: 50.0,
                                              height: 10.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                color: Color(0xffFFE4BC),
                                              ),
                                            ),
                                            Container(
                                              width: 10.0,
                                              height: 10.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                color: Color(0xffFFE4BC),
                                              ),
                                            )
                                          ]),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Text(
                                              i["name"],
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                color: Color(0xffFFE4BC),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Text(
                                              i["description"],
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Color(0xffFFE4BC),
                                              ),
                                            ),
                                          ),
                                          Stack(children: [
                                            SizedBox(
                                              height: 20.0,
                                              child: LinearProgressIndicator(
                                                value: _doub.toDouble(),
                                                // minHeight: 20,
                                                backgroundColor:
                                                    Color(0xffFFE4BC),
                                                valueColor:
                                                    new AlwaysStoppedAnimation(
                                                        Color(0xffF55E61)),
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                "${i["completeChallenges"]} / ${i["totalChallenges"]}",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ])
                                        ],
                                      ),
                                    ));
                              },
                            );
                          }).toList(),
                        )
                      ],
                    ))
                  ])
                ]))));
  }
}
