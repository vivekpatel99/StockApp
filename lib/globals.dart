import 'package:flutter/material.dart';

//------------------------------------------------------------------------------
const String kCurrenciesJsonPath = 'assets/currencies.json';

//------------------------------------------------------------------------------
const Color whiteColor = Colors.white;
const String font = 'Merriweather';

//------------------------------------------------------------------------------
TextStyle kHomeSubTitleStyle = const TextStyle(
    fontFamily: font,
    fontWeight: FontWeight.bold,
    color: whiteColor,
    fontSize: 24.0);

TextStyle kCurrencyWidgetStyle = const TextStyle(
  fontFamily: font,
  fontWeight: FontWeight.bold,
  color: whiteColor,
  fontSize: 18.0,
  letterSpacing: 1.0,
);
TextStyle kCurrencyHintTextWidStyle = const TextStyle(
  fontFamily: font,
  fontWeight: FontWeight.bold,
  color: whiteColor,
  fontSize: 18.0,
  letterSpacing: 1.0,
);
//------------------------------------------------------------------------------
InputDecoration kTextFieldDecoration = const InputDecoration(
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

InputDecoration kAlertTextFieldDecoration = const InputDecoration(
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

//------------------------------------------------------------------------------
RoundedRectangleBorder kCardShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(20),
);
