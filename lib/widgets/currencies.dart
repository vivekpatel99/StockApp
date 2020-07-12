import 'package:StockApp/services/currencyservice.dart';
import 'package:flutter/material.dart';

import 'currency_row.dart';

class Currencies extends StatefulWidget {
  @override
  _CurrenciesState createState() => _CurrenciesState();
}

class _CurrenciesState extends State<Currencies> {
  /* final Map<String, List<String>> currenciesList1 = {
    'currencies': [
      'EUR',
      'INR',
      'USD',
      'PUD',
      'EUR',
      'INR',
      'USD',
      'PUD',
      'EUR',
      'INR',
      'USD',
      'PUD',
    ],
    'images': [
      'assets/images/europe.png',
      'assets/images/india.png',
      'assets/images/europe.png',
      'assets/images/india.png',
      'assets/images/europe.png',
      'assets/images/india.png',
      'assets/images/europe.png',
      'assets/images/india.png',
      'assets/images/europe.png',
      'assets/images/india.png',
      'assets/images/europe.png',
      'assets/images/india.png',
    ],
  }; */
  var currenciesList;

  @override
  void initState() {
    super.initState();
    currenciesList = loadCurrencies();
    print(currenciesList.addedCurrencies.length);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        height: MediaQuery.of(context).size.height - 172,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: currenciesList.addedCurrencies.length - 1,
          itemBuilder: (BuildContext context, int index) {
            print(currenciesList);
            return CurrencyRow(currenciesList: currenciesList, index: index);
          },
        ),
      ),
    );
  }
}
