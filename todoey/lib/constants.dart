import 'package:flutter/material.dart';

final kMainColor = Colors.brown.shade100;
const kAddTaskColor = Colors.blueGrey;
const kInactiveScreenColor = Color(0xFF757575);
const kAddTaskStyle = TextStyle(fontSize: 30.0, color: kAddTaskColor);

const kLargeTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
  color: Colors.white,
);

const kTaskNumberTextStyle = TextStyle(
  fontSize: 18.0,
  color: Colors.white,
);

const kListPadding = EdgeInsets.symmetric(
  vertical: 30.0,
  horizontal: 20,
);

const kScaffoldPadding = EdgeInsets.only(
  left: 40,
  right: 40,
  top: 65,
  bottom: 60,
);

const kRoundedBottomDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ));

final ButtonStyle customButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(kAddTaskColor),
);
