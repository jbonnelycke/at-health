import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:health/screens/home_screen.dart';
import 'package:health/services/server_demo_service.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:at_demo_data/at_demo_data.dart' as at_demo_data;

String atSign;

class LoginScreen extends StatefulWidget {
  static final String id = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // TODO: Instantiate variables
  bool showSpinner = false;
  TextEditingController _loginTextFieldController = TextEditingController();
  ServerDemoService _serverDemoService = ServerDemoService.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ModalProgressHUD(
            // TODO: Assign boolean to inAsyncCall
            inAsyncCall: showSpinner,
            child: Center(
                child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xffF55E61), Color(0xffFFE4BC)])),
              child: SingleChildScrollView(
                  child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly, TODO
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
                      child: Container(
                        height: 200.0,
                        width: 200.0,
                        child: Text(
                          '@Health',
                          style: TextStyle(
                              fontSize: 50,
                              fontFamily: 'RopaSans',
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ),
                    ),
                    Container(
                      child: Image.asset('assets/health_logo.png'),
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: 'AtSign'),
                      //TODO: Assign to controller
                      controller: _loginTextFieldController,
                      onChanged: (value) {
                        atSign = value;
                      },
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: Text('Login'),
                          color: Colors.blue,
                          onPressed: _login,
                        ),
                        FlatButton(
                          child: Text('Cancel'),
                          color: Colors.blue,
                          onPressed: () {/** */},
                        ),
                      ],
                    )
                  ]),

            )
            ))));
  }

  // TODO: Write _login method
  _login() async {
    FocusScope.of(context).unfocus();
    setState(() {
      showSpinner = true;
    });
    if (atSign != null) {
      _serverDemoService.onboard().then((value) {
        Navigator.pushNamed(context, HomeScreen.id);
      }).catchError((error) async {
        await _serverDemoService.authenticate(atSign,
            cramSecret: at_demo_data.cramKeyMap[atSign]);
        Navigator.pushNamed(context, HomeScreen.id);
      });
    }
  }
}
