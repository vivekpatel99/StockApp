import 'package:flutter/material.dart';

import 'currency_row.dart';

class Currencies extends StatefulWidget {
  @override
  _CurrenciesState createState() => _CurrenciesState();
}

class _CurrenciesState extends State<Currencies> {
  final Map<String, List<String>> currenciesList = {
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
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        height: MediaQuery.of(context).size.height - 172,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: currenciesList['currencies'].length - 1,
          itemBuilder: (BuildContext context, int index) {
            return CurrencyRow(currenciesList: currenciesList, index: index);
          },
        ),
      ),
    );
  }
}
