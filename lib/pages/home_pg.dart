import 'package:StockApp/models/currency_model.dart';
import 'package:StockApp/services/currencyservice.dart';
import 'package:StockApp/widgets/category_selector.dart';
import 'package:StockApp/widgets/currencies_comparison_card.dart';
import 'package:flutter/material.dart';

import '../others/mylog_printer.dart';

final log = getLogger('HomePage');

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CurrenciesComparisonCard> comparisionCard = [];
  Currency currency = Currency();
  CurrencyModel currencyList;
  bool floatingButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading:
            IconButton(icon: Icon(Icons.menu), iconSize: 30, onPressed: () {}),
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
            child: floatingButtonPressed == false
                ? Container()
                : ListView.builder(
                    itemCount: comparisionCard.length,
                    itemBuilder: (context, index) {
                      return comparisionCard[index];
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          floatingButtonPressed = true;
          currencyList = await currency.loadCurrencies();
          setState(
            () {
              comparisionCard.add(
                CurrenciesComparisonCard(
                    key: UniqueKey(), currency: currencyList.addedCurrencies),
              );
            },
          );
        },
        backgroundColor: Color(0xFFBB86FC),
        child: Icon(Icons.add),
      ),
    );
  }
}
