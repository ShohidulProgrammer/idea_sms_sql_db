import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// Reusable alert style
var kAlertStyle = AlertStyle(
  animationType: AnimationType.fromTop,
  isCloseButton: false,
  overlayColor: Colors.white10,
  animationDuration: Duration(milliseconds: 50),
);


var kTitleStyle = const TextStyle(
color: Colors.black,
fontWeight: FontWeight.w500,
fontStyle: FontStyle.normal,
fontSize: 22.0);

var kSubTitleStyle = const TextStyle(
color: Colors.black,
fontWeight: FontWeight.w400,
fontStyle: FontStyle.normal,
fontSize: 18.0);

var kButtonAreaPadding = const EdgeInsets.all(20.0);