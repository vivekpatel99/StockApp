import 'package:StockApp/globals.dart';
import 'package:StockApp/models/home_pg_args_model.dart';
import 'package:StockApp/others/mylog_printer.dart';
import 'package:StockApp/pages/home_pg.dart';
import 'package:StockApp/services/currencyservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final log = getLogger('LoadingScreen');

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key key}) : super(key: key);
  static const String id = 'loading_screen';
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLoadCurrenciesHomePg();
  }

  void getLoadCurrenciesHomePg() async {
    log.i('getLoadCurrenciesHomePg');
    final currencyList = await Currency().loadInitCurrencies();
    Navigator.pushNamed(
      context,
      HomePage.id,
      arguments: HomePageArgs(
          addedcurrencyList: currencyList[0],
          dfltcurrencyList: currencyList[1]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: kProgressIndicator,
    );
  }
}

class LoadingPageArguments {
  final String pageId;
  LoadingPageArguments({this.pageId});
}
