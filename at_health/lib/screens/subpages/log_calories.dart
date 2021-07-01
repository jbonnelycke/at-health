import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:health/objects/food.dart';
import 'package:health/screens/home_screen.dart';

/*
TODO: Implement data persistence
TODO: Implement data persistence
TODO: Add a progress bar
TODO: Parse Goals to int
TODO: Add sharing feature
*/

class LogCalories extends StatefulWidget {
  static final String id = 'log calories';

  @override
  _LogCaloriesState createState() => _LogCaloriesState();
}

class _LogCaloriesState extends State<LogCalories> {
  //Food myfood = Food(name: "", amount: 1);
  String temp;
  String ltemp;
  String dtemp;

  //List<Food> bfoods = List();
  // List<String> bfoods = List();
  // List<String> lfoods = List();
  // List<String> dfoods = List();

  List<Food> bFoods = List<Food>();
  List<Food> lFoods = List<Food>();
  List<Food> dFoods = List<Food>();

  Widget OptionWidget({Food food, List<Food> foodArr, int index}) {
    return Container(
      child: Row(
        children: [
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                editFoodLogAlertDialog(context, food);
              }),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                foodArr.removeAt(index);
                setState(() {
                  foodArr = foodArr;
                });
              }),
        ],
      ),
    );
  }

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
            ),
            actions: <Widget>[
              MaterialButton(
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

  Future<Food> createFoodLogAlertDialog(
      BuildContext context, List<Food> foodArr) {
    Food temp;
    TextEditingController nameCustomController = TextEditingController();
    TextEditingController amountCustomController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0)),
            backgroundColor: Color(0xffFFD4A9),
            title: Text(
              'Calorie Log:',
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
                    controller: nameCustomController,
                    decoration: InputDecoration(
                      hintText: 'Type of Food',
                    ),
                    onChanged: (str) {
                      //myfood.name = str;
                      temp.name = str;
                    },
                  ),
                  TextField(
                    controller: amountCustomController,
                    decoration: InputDecoration(
                      hintText: 'Amount',
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text('Create log'),
                onPressed: () {
                  // try {
                  setState(() {
                    //myfood.name = customController.text;
                    // dtemp = nameCustomController.text +
                    //     " - " +
                    //     amountCustomController.text;
                    String name = nameCustomController.text;
                    print("Worked for name variable " + name);
                    int amount = int.parse(amountCustomController.text);
                    print('Worked for amount variable $amount');
                    temp = new Food(name: name, amount: amount);
                    print('Worked for food variable,temp, $temp ');
                    print('Name of Food ${temp.name}');
                    print('Amount of calories for Food ${temp.amount}');
                    foodArr.add(temp);
                    print('Food added to array $foodArr');
                    //bfoods.add(myfood);
                  });
                  Navigator.of(context).pop(temp);
                  // } catch (e) {
                  //   print("We HAVE AN ERROR!!!!!!");
                  //   print("We HAVE AN ERROR!!!!!!");
                  //   print("We HAVE AN ERROR!!!!!!");
                  //   print("We HAVE AN ERROR!!!!!!");
                  //   print("We HAVE AN ERROR!!!!!!");
                  //   print(e);
                  // }
                },
              ),
            ],
          );
        });
  }

  void editFoodLogAlertDialog(BuildContext context, Food food) {
    TextEditingController nameCustomController = TextEditingController();
    TextEditingController amountCustomController = TextEditingController();

    nameCustomController.text = food.name;
    amountCustomController.text = food.amount.toString();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0)),
            backgroundColor: Color(0xffFFD4A9),
            title: Text(
              'Calorie Log:',
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
                    controller: nameCustomController,
                    decoration: InputDecoration(
                      hintText: 'Type of Food',
                    ),
                    onChanged: (str) {
                      //myfood.name = str;
                      food.name = str;
                    },
                  ),
                  TextField(
                    controller: amountCustomController,
                    decoration: InputDecoration(
                      hintText: 'Amount',
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text('Create log'),
                onPressed: () {
                  // try {
                  setState(() {
                    food.amount = int.parse(amountCustomController.text);
                  });
                  Navigator.of(context).pop();
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
              child: ListView(
                children: [
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      'Daily Calorie Count',
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
                        width: 250.0,
                      ),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Color(0xff54B87C),
                        onPressed: () {
                          createAlertDialog(context).then((onValue) {
                            if (!(onValue == "")) {
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
                            }
                          });
                        },
                        child: Text(
                          'Goal',
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
                          'Breakfast:',
                          style: TextStyle(
                              fontSize: 36,
                              fontFamily: 'RopaSans',
                              color: Color(0xff5CCB88)),
                        ),
                        IconButton(
                          onPressed: () {
                            createFoodLogAlertDialog(context, bFoods);
                          },
                          icon: Icon(
                            Icons.add,
                            size: 40.0,
                            color: Color(0xffF55E61),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Container(
                      child: ListView(
                        children: bFoods
                            .map((element) => GestureDetector(
                                  onLongPress: () => {
                                    editFoodLogAlertDialog(context, element)
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 10, 0),
                                          child: Icon(Icons.breakfast_dining,
                                              size: 25.0,
                                              color: Color(0xffFF898B)),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Text>[
                                              Text(
                                                element.name,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: 'RopaSans',
                                                  color: Color(0xffFFE4BC),
                                                ),
                                              ),
                                              Text(
                                                element.amount.toString(),
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'RopaSans',
                                                  color: Color(0xffC4C4C4),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        OptionWidget(
                                            food: element,
                                            foodArr: bFoods,
                                            index: bFoods.indexOf(element))
                                      ],
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                      height: 110,
                      width: 400,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
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
                          'Lunch:',
                          style: TextStyle(
                              fontSize: 36,
                              fontFamily: 'RopaSans',
                              color: Color(0xff5CCB88)),
                        ),
                        IconButton(
                          onPressed: () {
                            createFoodLogAlertDialog(context, lFoods);
                          },
                          icon: Icon(
                            Icons.add,
                            size: 40.0,
                            color: Color(0xffF55E61),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Container(
                      child: ListView(
                        children: lFoods
                            .map((element) => GestureDetector(
                                  onLongPress: () => {
                                    editFoodLogAlertDialog(context, element)
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 10, 0),
                                          child: Icon(Icons.breakfast_dining,
                                              size: 25.0,
                                              color: Color(0xffFF898B)),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Text>[
                                              Text(
                                                element.name,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: 'RopaSans',
                                                  color: Color(0xffFFE4BC),
                                                ),
                                              ),
                                              Text(
                                                element.amount.toString(),
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'RopaSans',
                                                  color: Color(0xffC4C4C4),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        OptionWidget(
                                            food: element,
                                            foodArr: lFoods,
                                            index: lFoods.indexOf(element))
                                      ],
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                      height: 110,
                      width: 400,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
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
                          'Dinner:',
                          style: TextStyle(
                              fontSize: 36,
                              fontFamily: 'RopaSans',
                              color: Color(0xff5CCB88)),
                        ),
                        IconButton(
                          onPressed: () {
                            createFoodLogAlertDialog(context, dFoods);
                          },
                          icon: Icon(
                            Icons.add,
                            size: 40.0,
                            color: Color(0xffF55E61),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Container(
                      child: ListView(
                        children: dFoods
                            .map((element) => GestureDetector(
                                  onLongPress: () => {
                                    editFoodLogAlertDialog(context, element)
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 10, 0),
                                          child: Icon(Icons.breakfast_dining,
                                              size: 25.0,
                                              color: Color(0xffFF898B)),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Text>[
                                              Text(
                                                element.name,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: 'RopaSans',
                                                  color: Color(0xffFFE4BC),
                                                ),
                                              ),
                                              Text(
                                                element.amount.toString(),
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'RopaSans',
                                                  color: Color(0xffC4C4C4),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        OptionWidget(
                                            food: element,
                                            foodArr: dFoods,
                                            index: dFoods.indexOf(element))
                                      ],
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                      height: 110,
                      width: 400,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Color(0xffF55E61),
                          border: Border.all(
                            color: Color(0xffF55E61),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
