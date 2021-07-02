import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

/*
TODO: Give logo box shadow

*/
Widget HealthBar({Widget bottom}) {
  var gradientAppBar = new GradientAppBar(
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Image.asset('assets/health_logo.png'),
      ),
      bottom: bottom,
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xffF55E61), Color(0xffFFBE8F)],
          stops: [0, 0.6]));
  return gradientAppBar;
}
