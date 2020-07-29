import 'package:StockApp/models/currency_model.dart';
import 'package:StockApp/widgets/category_selector.dart';
import 'package:StockApp/widgets/currencies_comparison_card.dart';
import 'package:flutter/material.dart';

import '../others/mylog_printer.dart';

final log = getLogger('HomePage');

class HomePageArgs {
  final List<CurrencyType> addedcurrencyList;
  final List<CurrencyType> dfltcurrencyList;

  HomePageArgs(
      {@required this.addedcurrencyList, @required this.dfltcurrencyList});
}

class HomePage extends StatefulWidget {
  static const String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<CurrenciesComparisonCard> comparisionCardList = [];

  @override
  Widget build(BuildContext context) {
    final HomePageArgs args = ModalRoute.of(context).settings.arguments;
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
                : ListView.builder(
                    itemCount: args.addedcurrencyList.length,
                    itemBuilder: (context, index) {
                      comparisionCardList.add(
                        CurrenciesComparisonCard(
                            currency: args.dfltcurrencyList),
                      );
                      return CurrenciesComparisonCard(
                          currency: args.addedcurrencyList);
                    }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // CurrencyModel currencyList = await currency.loadCurrencies();
          comparisionCardList.add(
            CurrenciesComparisonCard(currency: args.dfltcurrencyList),
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
