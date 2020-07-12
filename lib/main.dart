import 'package:StockApp/AppTheme.dart';
import 'package:StockApp/pages/home_pg.dart';
import 'package:flutter/material.dart';
//https://pub.dev/packages/frankfurter#-installing-tab-
void main() => runApp(StockApp());

class StockApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme, //AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
