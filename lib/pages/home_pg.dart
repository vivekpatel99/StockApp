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

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<CurrenciesComparisonCard> comparisionCardList = [];
  Currency currency = Currency();

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
            child: comparisionCardList.length != 0
                ? ListView.builder(
                    itemCount: comparisionCardList.length,
                    itemBuilder: (context, index) {
                      return comparisionCardList[index];
                    },
                  )
                : FutureBuilder(
                    future: currency.loadInitCurrencies(),
                    builder: (context, currencyListSnap) {
                      if (currencyListSnap.hasData) {
                        return ListView.builder(
                            itemCount: currencyListSnap.data.length,
                            itemBuilder: (context, index) {
                              comparisionCardList.add(
                                CurrenciesComparisonCard(
                                    currency: currencyListSnap.data),
                              );
                              return CurrenciesComparisonCard(
                                  currency: currencyListSnap.data);
                            });
                      } else if (currencyListSnap.hasError) {
                        return Container();
                      }
                      return CircularProgressIndicator();
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          CurrencyModel currencyList = await currency.loadCurrencies();
          comparisionCardList.add(
            CurrenciesComparisonCard(currency: currencyList.addedCurrencies),
          );
          setState(
            () {},
          );
        },
        backgroundColor: Color(0xFFBB86FC),
        child: Icon(Icons.add),
      ),
    );
  }
}
