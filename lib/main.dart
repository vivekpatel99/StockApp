import 'package:flutter/material.dart';
import 'package:hello/models/user_input.dart';
import 'package:hello/pages/home_pg.dart';
import 'package:provider/provider.dart';

//TODO1 add functionality to convert input money to output money value
//TODO2 add WebServices into money conversion
//TODO3 add Alert functionality
//TODO4 merge and push

void main() => runApp(StockApp());

class StockApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserInput>(
      create: (context) => UserInput(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
