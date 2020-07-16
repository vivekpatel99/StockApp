import 'dart:convert';

import 'package:StockApp/globals.dart';
import 'package:StockApp/models/currency_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Currency extends ChangeNotifier {
  // Currency._();

  CurrencyModel currency;
  List<List<CurrenyType>> displayCurrenciesList = [];

//------------------------------------------------------------

  Future<String> _loadCurrencyAsset() async {
    return await rootBundle.loadString(kCurrenciesJsonPath);
  }

//------------------------------------------------------------

  Future<CurrencyModel> loadCurrencies() async {
    print('currency service');

    String jsonCurrencies = await _loadCurrencyAsset();
    final jsonResponse = json.decode(jsonCurrencies);
    currency = CurrencyModel.fromJson(jsonResponse);

    print(currency.defaultCurrencies[0].name);

    return currency;
  }

//------------------------------------------------------------
  // static Future<Currency> create() async {
  //   Currency currency = Currency._();
  //   await Currency.create();
  //   return currency;
  // }

//------------------------------------------------------------
  void displayCurrencyTile() async {
    // setUp();
    print(currency.addedCurrencies[0].name);
    if (currency.addedCurrencies.isNotEmpty) {
      displayCurrenciesList.add(currency.addedCurrencies);
    }
    print(displayCurrenciesList);
  }

//------------------------------------------------------------
  void newCurrenyTileAdd() async {
    displayCurrenciesList.add(currency.defaultCurrencies);
  }
}
