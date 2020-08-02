import 'package:StockApp/models/home_pg_args.dart';
import 'package:StockApp/models/user_input.dart';
import 'package:StockApp/widgets/category_selector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../others/mylog_printer.dart';

final log = getLogger('HomePage');

class HomePage extends StatefulWidget {
  static const String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final HomePageArgs args = ModalRoute.of(context).settings.arguments;
    return Consumer<UserInput>(builder: (context, inputData, child) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
              icon: Icon(Icons.menu), iconSize: 30, onPressed: () {}),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: IconButton(
                  tooltip: 'Next Choice',
                  icon: const Icon(
                    Icons.add,
                    size: 30,
                  ),
                  onPressed: () {}),
            ),
          ],
          elevation: 0.0,
        ),
        body: Column(
          children: <Widget>[
            CategorySelector(),
            Expanded(
              child: ListView.builder(
                  itemCount: inputData.comparisionCardList.length,
                  itemBuilder: (context, index) {
                    return inputData.updateComparisionCardList(index);
                  }),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            log.i('floatingActionButton pressed');
            setState(
              () {
                inputData.addCurrenciesComparisonCard(args: args);
              },
            );
          },
          backgroundColor: Color(0xFFBB86FC),
          child: Icon(Icons.add),
        ),
      );
    });
  }
}
