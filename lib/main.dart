import 'package:StockApp/models/user_input.dart';
import 'package:StockApp/pages/home_pg.dart';
import 'package:StockApp/services/currencyservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//TODO 1 add functionality to add more currency conversion tile by pressing floating button
//TODO 1.1 long pressed remove currency conversion tile
//TODO 2 add WebServices into money conversion
//TODO 3 add Alert functionality
//TODO 4  merge and push

void main() => runApp(StockApp());

class StockApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserInput>(create: (context) => UserInput()),
        ChangeNotifierProvider<Currency>(create: (context) => Currency()),
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
