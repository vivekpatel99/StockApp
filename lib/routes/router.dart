import 'package:StockApp/globals.dart';
import 'package:StockApp/pages/home_pg.dart';
import 'package:StockApp/pages/loading_pg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case kLoadingPageRoute:
      return MaterialPageRoute(builder: (context) => LoadingScreen());
    case kHomePageRoute:
      var args = settings.arguments;
      return MaterialPageRoute(builder: (context) => HomePage(args));
    default:
      return MaterialPageRoute(builder: (context) => null);
  }
}
