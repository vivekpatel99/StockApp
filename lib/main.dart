import 'package:flutter/material.dart';
import 'package:hello/pages/home_pg.dart';

void main() => runApp(StockApp());

class StockApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
