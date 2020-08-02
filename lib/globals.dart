import 'package:flutter/material.dart';

//------------------------------------------------------------------------------
const String kCurrenciesJsonPath = 'assets/currencies.json';

//------------------------------------------------------------------------------
Color whiteColor = Colors.white;
String font = 'Merriweather';

//------------------------------------------------------------------------------
TextStyle kHomeSubTitleStyle = TextStyle(
    fontFamily: font,
    fontWeight: FontWeight.bold,
    color: whiteColor,
    fontSize: 24.0);

TextStyle kCurrencyWidgetStyle = TextStyle(
  fontFamily: font,
  fontWeight: FontWeight.bold,
  color: whiteColor,
  fontSize: 18.0,
  letterSpacing: 1.0,
);
TextStyle kCurrencyHintTextWidStyle = TextStyle(
  fontFamily: font,
  fontWeight: FontWeight.bold,
  color: whiteColor,
  fontSize: 18.0,
  letterSpacing: 1.0,
);
//------------------------------------------------------------------------------
InputDecoration kTextFieldDecoration = InputDecoration(
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFFBB86FC),
    ),
  ),
  border: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFFAFAFAF),
    ),
  ),
);

InputDecoration kAlertTextFieldDecoration = InputDecoration(
  hintText: '0.0',
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFFBB86FC),
    ),
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFFAFAFAF),
    ),
  ),
);
//------------------------------------------------------------------------------
Widget kProgressIndicator = Center(
  child: CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFBB86FC)),
  ),
);
