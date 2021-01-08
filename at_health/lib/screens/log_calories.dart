import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:health/data%20objects/food.dart';
import 'package:health/screens/home_screen.dart';

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
  List<String> bfoods = List();
  List<String> lfoods = List();
  List<String> dfoods = List();


  Future<String> createAlertDialog(BuildContext context){
    TextEditingController customController = TextEditingController();

    return showDialog(context: context, builder: (context){
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0)
        ),
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
            onPressed: (){
              Navigator.of(context).pop(customController.text.toString());
              //print(customController.text.toString());
            },
          ),
        ],
      );
    });
  }

  Future<String> createLogAlertDialog(BuildContext context){
    TextEditingController customController = TextEditingController();
    TextEditingController customController2 = TextEditingController();
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0)
        ),
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
                controller: customController,
                decoration: InputDecoration(
                  hintText: 'Type of Food',
                ),
                onChanged: (str){
                 //myfood.name = str;
                  temp = str;
                },
              ),
              TextField(
                controller: customController2,
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
            onPressed: (){
              Navigator.of(context).pop(customController.text.toString());
              setState(() {
                //myfood.name = customController.text;
                temp = customController.text + " - " + customController2.text ;
                bfoods.add(temp);
                //bfoods.add(myfood);
              });
            },
          ),
        ],
      );
    });
  }

  Future<String> createLunchLogAlertDialog(BuildContext context){
    TextEditingController customController = TextEditingController();
    TextEditingController customController2 = TextEditingController();
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0)
        ),
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
                controller: customController,
                decoration: InputDecoration(
                  hintText: 'Type of Food',
                ),
                onChanged: (str){
                  //myfood.name = str;
                  ltemp = str;
                },
              ),
              TextField(
                controller: customController2,
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
            onPressed: (){
              Navigator.of(context).pop(customController.text.toString());
              setState(() {
                //myfood.name = customController.text;
                ltemp = customController.text + " - " + customController2.text ;
                lfoods.add(ltemp);
                //bfoods.add(myfood);
              });
            },
          ),
        ],
      );
    });
  }

  Future<String> createDinnerLogAlertDialog(BuildContext context){
    TextEditingController customController = TextEditingController();
    TextEditingController customController2 = TextEditingController();
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0)
        ),
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
                controller: customController,
                decoration: InputDecoration(
                  hintText: 'Type of Food',
                ),
                onChanged: (str){
                  //myfood.name = str;
                  dtemp = str;
                },
              ),
              TextField(
                controller: customController2,
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
            onPressed: (){
              Navigator.of(context).pop(customController.text.toString());
              setState(() {
                //myfood.name = customController.text;
                dtemp = customController.text + " - " + customController2.text ;
                dfoods.add(dtemp);
                //bfoods.add(myfood);
              });
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
                      top : 25,
                      right : 10,
                      child : ButtonTheme(
                          minWidth : 32,
                          height : 32,
                          child : RaisedButton(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            HomeScreen()));
                              },
                              shape : RoundedRectangleBorder(
                                  borderRadius : BorderRadius.circular(40),
                                  side : BorderSide(color : Color(0xfff55e61))
                              ),
                              color : Color(0xfff55e61),
                              textColor: Colors.white,
                              child : Text("X",
                                  style : TextStyle(
                                      fontSize : 12,
                                      color: Colors.white
                                  )
                              )
                          )
                      )
                  ),
                ),
              ],
            ),
          ),
          backgroundColorStart: Color(0xffF55E61),
          backgroundColorEnd: Color(0xffFFE4BC)),
      body: Builder(builder: (context){
        return Center(
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
                        'Daily Calorie Count',
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
                        onPressed: (){},
                        icon: Icon(
                          Icons.share_rounded,
                          color: Colors.blue[200],
                          size: 40.0,
                        )
                    ),
                    SizedBox(
                      width: 250.0,
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      color: Color(0xff54B87C),
                      onPressed: (){
                        createAlertDialog(context).then((onValue){
                          if(!(onValue == "")){
                            SnackBar mySnackBar = SnackBar(
                              content: Text('Your diet goal has been set to $onValue calories!',
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
                        onPressed: (){
                          createLogAlertDialog(context);
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
                      children: bfoods.map((element) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,0, 10, 0),
                              child: Icon(
                                  Icons.fastfood_rounded,
                                  size: 25.0,
                                  color: Color(0xffFF898B)
                              ),
                            ),
                            Text(element,
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'RopaSans',
                                color: Color(0xffFFE4BC),
                              ),
                            ),
                          ],
                        ),
                      )).toList(),
                    ),
                    height: 110,
                    width:400,
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
                        'Lunch:',
                        style: TextStyle(
                            fontSize: 36,
                            fontFamily: 'RopaSans',
                            color: Color(0xff5CCB88)),
                      ),
                      IconButton(
                        onPressed: (){
                          createLunchLogAlertDialog(context);
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
                      children: lfoods.map((element) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,0, 10, 0),
                              child: Icon(
                                  Icons.rice_bowl_rounded,
                                  size: 25.0,
                                  color: Color(0xffFF898B)
                              ),
                            ),
                            Text(element,
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'RopaSans',
                                color: Color(0xffFFE4BC),
                              ),
                            ),
                          ],
                        ),
                      )).toList(),
                    ),
                    height: 110,
                    width:400,
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
                        'Dinner:',
                        style: TextStyle(
                            fontSize: 36,
                            fontFamily: 'RopaSans',
                            color: Color(0xff5CCB88)),
                      ),
                      IconButton(
                        onPressed: (){
                          createDinnerLogAlertDialog(context);
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
                      children: dfoods.map((element) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,0, 10, 0),
                              child: Icon(
                                  Icons.tapas_rounded,
                                  size: 25.0,
                                  color: Color(0xffFF898B)
                              ),
                            ),
                            Text(element,
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'RopaSans',
                                color: Color(0xffFFE4BC),
                              ),
                            ),
                          ],
                        ),
                      )).toList(),
                    ),
                    height: 110,
                    width:400,
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
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      })
    );
  }
}



