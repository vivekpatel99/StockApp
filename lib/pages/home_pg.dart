import 'package:StockApp/models/user_input_model.dart';
import 'package:StockApp/services/database_service.dart';
import 'package:StockApp/widgets/category_selector_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../others/mylog_printer.dart';

final log = getLogger('HomePage');

//==============================================================================
class HomePage extends StatefulWidget {
  final _args;
  HomePage(this._args);
  @override
  _HomePageState createState() => _HomePageState();
}

//==============================================================================
class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Provider.of<DatabaseService>(context).openHiveBox();
    return Consumer<UserInput>(
      builder: (context, inputData, child) {
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
                child: inputData.buildValueListenableBuilder(),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              log.i('floatingActionButton pressed');
              inputData.addCurrenciesComparisonCard(args: widget._args);
              setState(
                () {},
              );
            },
            backgroundColor: const Color(0xFFBB86FC),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

//------------------------------------------------------------------------------
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
