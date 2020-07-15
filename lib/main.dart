import 'package:StockApp/models/user_input.dart';
import 'package:StockApp/pages/home_pg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//TODO1 add functionality to add more currency conversion tile by pressing floating button
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
