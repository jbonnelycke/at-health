import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:at_commons/at_commons.dart';
import 'package:health/screens/tabs/ProfileScreenTab.dart';
import 'package:health/services/server_demo_service.dart';
import 'package:health/screens/home_screen.dart';
import 'login_screen.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:health/components/HealthBar.dart';
import 'package:health/components/CompTabBar.dart';

class MedCardScreen extends StatefulWidget {
  static final String id = 'medcard';

  @override
  _MedCardScreenState createState() => _MedCardScreenState();
}

class _MedCardScreenState extends State<MedCardScreen> {

  String _nameValue;
  String _addressValue;
  String _contactValue;
  String _dobValue;
  String _heightValue;
  String _weightValue;


  // lookup
  TextEditingController _lookupNameTextFieldController = TextEditingController();
  TextEditingController _lookupAddressTextFieldController = TextEditingController();
  TextEditingController _lookupContactTextFieldController = TextEditingController();
  TextEditingController _lookupDOBTextFieldController = TextEditingController();
  TextEditingController _lookupHeightTextFieldController = TextEditingController();
  TextEditingController _lookupWeightTextFieldController = TextEditingController();

  // service
  ServerDemoService _atClientService = ServerDemoService.getInstance();

  @override
  void initState() {
    super.initState();
    //_atClientService.initClient(atSign);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(135, 0, 0, 0),
          child: Image.asset('assets/health_logo.png'),
        ),
        //bottom: bottom,
        backgroundColorStart: Color(0xffF55E61),
        backgroundColorEnd: Color(0xffFFE4BC),
      ),
      body: Center(
          child: Container(
          )),
    );
  }

}