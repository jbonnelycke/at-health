import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

Widget HealthBar({Widget bottom}) {
  var gradientAppBar = new GradientAppBar(
    title: Padding(
      padding: const EdgeInsets.fromLTRB(135, 0, 0, 0),
      child: Image.asset('assets/health_logo.png'),
    ),
    bottom: bottom,
    backgroundColorStart: Color(0xffF55E61),
        backgroundColorEnd: Color(0xffFFE4BC),
        );
  return gradientAppBar;
}
