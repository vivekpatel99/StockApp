import 'package:StockApp/pages/home_pg.dart';
import 'package:StockApp/services/currencyservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({Key key}) : super(key: key);
  static const String id = 'loading_screen';

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLoadCurrencies();
  }

  void getLoadCurrencies() async {
    final currencyList = await Currency().loadInitCurrencies();
    Navigator.pushNamed(context, HomePage.id,
        arguments: HomePageArgs(
            addedcurrencyList: currencyList[0],
            dfltcurrencyList: currencyList[1]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFBB86FC)),
        ),
      ),
    );
  }
}
