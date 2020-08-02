import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget version() {
  return Text(
    "Eru Duyuru v1.0.0",
    style: TextStyle(fontSize: 10, color: Colors.yellow),
  );
}

Widget assignment() {
  return GestureDetector(
    onTap: () {
      launch("https://www.linkedin.com/in/mtyuksel/");
    },
    child: Container(
      height: 8,
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.all(20),
      child: Text(
        "Developed by M. Tevfik Yüksel",
        style: TextStyle(fontSize: 8),
      ),
    ),
  );
}


Widget assignmentDark() {
  return GestureDetector(
    onTap: () {
      launch("https://www.linkedin.com/in/mtyuksel/");
    },
    child: Container(
      height: 12,
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.all(20),
      child: Text(
        "Developed by M. Tevfik Yüksel",
        style: TextStyle(fontSize: 10, color: Colors.white),
      ),
    ),
  );
}
