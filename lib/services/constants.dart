import 'package:flutter/material.dart';

Color kThemeColor = Color.fromARGB(255, 255, 120, 180);
Color kThemeColorLite = Color.fromARGB(255, 255, 190, 230);
Color kDarkBlue = Color.fromARGB(255, 25, 30, 50);

BoxDecoration kButtonStyleWhite = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(20)), color: Colors.white);
BoxDecoration kButtonStylePink = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    color: Color.fromARGB(255, 255, 120, 180));

BoxDecoration kDisplayScreen = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(5)),
  border: Border.all(color: Colors.grey),
  color: Colors.black38,
);

TextStyle kButtonText = TextStyle(color: kThemeColor, fontSize: 40);

TextStyle kUIText = TextStyle(
    color: Colors.white,
    fontFamily: 'Cagliostro',
    fontSize: 15,
    fontWeight: FontWeight.bold);
TextStyle kHeadingText =
    TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold);
