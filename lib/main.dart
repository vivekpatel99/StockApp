import 'package:StockApp/models/user_input.dart';
import 'package:StockApp/others/mylog_printer.dart';
import 'package:StockApp/pages/home_pg.dart';
import 'package:StockApp/services/currencyservice.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

//TODO1 add functionality to add more currency conversion tile by pressing floating button
//TODO1.1 long pressed remove currency conversion tile
//TODO2 add WebServices into money conversion
//TODO3 add Alert functionality
//TODO4  merge and push

void main() {
  Logger.level = Level.info;
  runApp(StockApp());
}

class StockApp extends StatelessWidget {
  final log = Logger(printer: MyLogPrinter('StockApp'));

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
