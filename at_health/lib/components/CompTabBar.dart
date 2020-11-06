import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CompTabBar() {
  return new PreferredSize(
    preferredSize: new Size(75, 75),
    child: Container(
      color: Color(0xff5ccb88),
      child: TabBar(
        labelColor: Colors.black,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Color(0xff54b87c)),
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: [
          Container(
            height: 75,
            child: Tab(
              icon: Icon(Icons.home_outlined, size: 50),
            ),
          ),
          Container(
            height: 75,
            child: Tab(
              icon: Icon(
                Icons.fitness_center_outlined,
                size: 50,
              ),
            ),
          ),
          Container(
            height: 75,
            child: Tab(
              icon: Icon(
                Icons.insert_link_outlined,
                size: 50,
              ),
            ),
          ),
          Container(
            height: 75,
            child: Tab(
              icon: Icon(
                Icons.account_circle_outlined,
                size: 50,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
