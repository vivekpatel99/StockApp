import 'package:StockApp/globals.dart';
import 'package:StockApp/models/home_pg_args_model.dart';
import 'package:StockApp/models/user_input_model.dart';
import 'package:StockApp/others/mylog_printer.dart';
import 'package:StockApp/services/currency_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final log = getLogger('LoadingScreen');

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key key}) : super(key: key);

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
    // await Future.delayed(Duration(seconds: 1), () => '1');
    Provider.of<UserInput>(context, listen: false).loadDataFromDatabase();
    final List<List<dynamic>> currencyList =
        await Currency().loadInitCurrencies();

    Navigator.pushNamed(
      context,
      kHomePageRoute,
      arguments: HomePageArgs(
        addedcurrencyList: currencyList[0],
        dfltcurrencyList: currencyList[1],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: kProgressIndicator,
    );
  }
}
