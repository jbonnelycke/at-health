import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class LogCalories extends StatefulWidget {
  static final String id = 'log calories';

  @override
  _LogCaloriesState createState() => _LogCaloriesState();
}

class _LogCaloriesState extends State<LogCalories> {
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
                          SnackBar mySnackbar = SnackBar(content: Text("Burn goal has been set to: $onValue"));
                          Scaffold.of(context).showSnackBar(mySnackbar);
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
                      'Lunch:',
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
                      'Dinner:',
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
              ],
          ),
        ),
      ),
    );
  }
}

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
          },
        ),
      ],
    );
  });
}