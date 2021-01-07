import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChallengeScreenTab extends StatefulWidget {
  @override
  _ChallengeScreenTabState createState() => _ChallengeScreenTabState();
}

class _ChallengeScreenTabState extends State<ChallengeScreenTab> {
  @override
  Widget build(BuildContext context) {
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
        'description': 'The Fitness Menace',
        'totalChallenges': 20,
        'completeChallenges': 0,
        'timed': true,
      },
      {
        'name': 'Girls get Gains part 2',
        'description': 'Attack of the Core',
        'totalChallenges': 20,
        'completeChallenges': 0,
        'timed': true,
      },
      {
        'name': 'Girls get Gains part 3',
        'description': 'Revenge of the Wall Sits',
        'totalChallenges': 20,
        'completeChallenges': 0,
        'timed': true,
      },
    ];
    // print(_send[0]['name']);

    return Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 5.0),
        child: Container(
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

                double _doub = i["completeChallenges"] / i["totalChallenges"];
                print("Index is ${i["name"]}. Value is ${_doub}");

                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        // height: 200.0,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            // color: Colors.amber,
                            gradient: RadialGradient(
                              center: const Alignment(
                                  0.2, 1.7), // near the top right
                              radius: 1.5,
                              colors: [
                                const Color(0xFFFB9B81),
                                const Color(0xFF5ccb88), // yellow sun
                                // const Color(0xFFFB9B81), // blue sky
                              ],
                              // stops: [0.5, 1.0],
                            ),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  width: 50.0,
                                  height: 10.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Color(0xffFFE4BC),
                                  ),
                                ),
                                Container(
                                  width: 10.0,
                                  height: 10.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Color(0xffFFE4BC),
                                  ),
                                )
                              ]),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(
                                  i["name"],
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Color(0xffFFE4BC),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10.0),
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
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: LinearProgressIndicator(
                                      value: _doub.toDouble(),
                                      // minHeight: 20,
                                      backgroundColor: Color(0xffFFE4BC),
                                      valueColor: new AlwaysStoppedAnimation(
                                          Color(0xffF55E61)),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "${i["completeChallenges"]} / ${i["totalChallenges"]}",
                                    style: TextStyle(color: Colors.black),
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
      ),
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

              double _doub = i["completeChallenges"] / i["totalChallenges"];
              print("Index is ${i["name"]}. Value is ${_doub}");

              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      // height: 200.0,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          // color: Colors.amber,
                          gradient: RadialGradient(
                            center:
                                const Alignment(0.2, 1.7), // near the top right
                            radius: 1.5,
                            colors: [
                              const Color(0xFFFB9B81),
                              const Color(0xFF5ccb88), // yellow sun
                              // const Color(0xFFFB9B81), // blue sky
                            ],
                            // stops: [0.5, 1.0],
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                width: 50.0,
                                height: 10.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Color(0xffFFE4BC),
                                ),
                              ),
                              Container(
                                width: 10.0,
                                height: 10.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Color(0xffFFE4BC),
                                ),
                              )
                            ]),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                i["name"],
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xffFFE4BC),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10.0),
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
                                  backgroundColor: Color(0xffFFE4BC),
                                  valueColor: new AlwaysStoppedAnimation(
                                      Color(0xffF55E61)),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "${i["completeChallenges"]} / ${i["totalChallenges"]}",
                                  style: TextStyle(color: Colors.black),
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
    ]);
  }
}
