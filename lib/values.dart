import 'package:flutter/material.dart';

Color mainColor = Color(0xFFFFFFFF);

Color mainDarkColor = Color(0xFFF6F6F6);

BoxDecoration cardDecoration = BoxDecoration(
  color: mainColor,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      blurRadius: 1.0,
      color: mainDarkColor,
      spreadRadius: 0.1,
    ),
  ],
);

// Color mainColor = Color(0xFF444273);

TextStyle redTextStyle = TextStyle(
  color: Color(0xFF97071C),
);

TextStyle doctorNameStyle = TextStyle(
  color: Colors.black,
  fontSize: 15.0,
);

TextStyle blackText = TextStyle(
  color: Colors.black,
);

TextStyle blackTextLow = TextStyle(
  color: Colors.black54,
);

EdgeInsets cardInsets =
    const EdgeInsets.only(top: 10.0, bottom: 5.0, left: 10.0, right: 10.0);
