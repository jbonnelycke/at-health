import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:health/screens/home_screen.dart';
import 'package:health/services/server_demo_service.dart';
import 'package:at_demo_data/at_demo_data.dart' as at_demo_data;

String atSign;

class LoginScreen extends StatefulWidget {
  static final String id = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // TODO: Instantiate variables
  TextEditingController _loginTextFieldController = TextEditingController();
  ServerDemoService _serverDemoService = ServerDemoService.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            // TODO: Assign boolean to inAsyncCall
            children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Color(0xffF55E61), Color(0xffFFE4BC)]
                        )
                    )
                ),
                Positioned(
                    bottom: 0,
                    left : 0,
                    width : MediaQuery.of(context).size.width,
                    child: Column(
                      children : <Widget>[
                        Image.asset("assets/wave.png",

                          width : MediaQuery.of(context).size.width
                        ),
                        Container(
                          width : MediaQuery.of(context).size.width,
                          height : 200,
                          decoration : BoxDecoration(
                            color : Color(0xffFFE4BC)
                          )
                        )
                      ]
                    ),
                ),
                Container(
                  decoration: BoxDecoration(
                    // color : Colors.red
                  ),
                  padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              // color : Colors.red
                            ),
                            width: double.infinity,
                            child: Text(
                              '@Health',
                              style: TextStyle(
                                  fontSize: 50,
                                  fontFamily: 'RopaSans',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red //Color(0xffF55E61)
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Image.asset('assets/health_logo.png'),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                          child: TextField(
                            decoration: InputDecoration(hintText: 'AtSign'),
                            controller: _loginTextFieldController,
                            onChanged: (value) {
                              atSign = value;
                            },
                          ),
                        ),
                        Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              // color : Colors.red
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                              Expanded(
                                  child: SizedBox(
                                      width: double.infinity,
                                      child: MaterialButton(
                                        //padding: EdgeInsets.all(8.0),
                                        textColor: Colors.white,
                                        splashColor: Colors.greenAccent,
                                        elevation: 8.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                        child: Container(
                                          width: 145,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            gradient: LinearGradient(
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomLeft,
                                                colors: [Color(0xff5CCB88), Color(0xff5CCB88)]),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                                            child: Text("LOGIN",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'RopaSans',
                                                )
                                            ),
                                          ),
                                        ),
                                        // ),
                                        onPressed: _login,
                                      )
                                  )
                              ),
                              Expanded(
                                  child: SizedBox(
                                      width: 250,
                                      child: MaterialButton(
                                        //padding: EdgeInsets.all(8.0),
                                        textColor: Colors.white,
                                        //splashColor: Colors.greenAccent,
                                        elevation: 8.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                        child: Container(
                                          width: 145,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            gradient: LinearGradient(
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomLeft,
                                                colors: [Color(0xffF55E61), Color(0xffFF55E61)]
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                                            child: Text("REGISTER",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'RopaSans',
                                                )
                                            ),
                                          ),
                                        ),
                                        // ),
                                        onPressed: () {
                                          print('Tapped');
                                        },
                                      )
                                  )
                              )
                            ]
                            )
                        ),
                      ]
                  ),
                )
            ]
        )
    );
  }

  _login() async {
    FocusScope.of(context).unfocus();
    if (atSign != null) {
      _serverDemoService.onboard().then((value) {
        Navigator.of(context).pushReplacement(new MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen()));
      }).catchError((error) async {
        await _serverDemoService.authenticate(atSign,
            cramSecret: at_demo_data.cramKeyMap[atSign]);
        Navigator.of(context).pushReplacement(new MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen()));
      });
    }
  }
}
