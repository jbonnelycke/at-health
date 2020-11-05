import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:health/components/CompTabBar.dart';

Widget HealthBar({Widget bottom}) {
  var gradientAppBar = new GradientAppBar(
    title: Padding(
      padding: const EdgeInsets.fromLTRB(135, 0, 0, 0),
      child: Image.asset('assets/health_logo.png'),
    ),
    bottom: bottom,
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xffF55E61), Color(0xffFFE4BC)]),
  );
  return gradientAppBar;
}

// class Yes extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Container(
//       height: 200.0,
//       width: 200.0,
//       child: GridView.count(
//           crossAxisCount: 2,
//           children: List.generate(4, (index) {
//             return Center(
//                 child: Container(
//               height: 75,
//               width: 100.0,
//               child: Center(child: Text('Junior')),
//               color: Colors.red[200],
//             ));
//           })),
//     );
//   }
// }

// class HealthBar extends StatefulWidget implements  {
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return _HealthBarState();
//     throw UnimplementedError();
//   }
// }

// class _HealthBarState extends State<HealthBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//       title: Image.asset("assets/health_polo.png"),
//       centerTitle: true,
//     ));
//   }
