import 'dart:convert';

import 'package:StockApp/globals.dart';
import 'package:StockApp/models/currency_model.dart';
import 'package:StockApp/others/mylog_printer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

final log = getLogger('Currency');

//==============================================================================
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
    log.i('loadCurrencies');

    String jsonCurrencies = await _loadCurrencyAsset();
    final jsonResponse = json.decode(jsonCurrencies);
    currency = CurrencyModel.fromJson(jsonResponse);

    // log.i('${currency.defaultCurrencies[0].name}');

    return currency;
  }

//------------------------------------------------------------
  Future<List<CurrenyType>> loadInitCurrencies() async {
    log.i('loadInitCurrencies');

    CurrencyModel _currency = await loadCurrencies();

    // log.i('${currency.defaultCurrencies[0].name}');
    log.i('${_currency.addedCurrencies}');
    return _currency.addedCurrencies;
  }

//------------------------------------------------------------
  void displayCurrencyTile() async {
    final currency = await loadCurrencies();
    if (currency.addedCurrencies.isNotEmpty) {
      displayCurrenciesList.add(currency.addedCurrencies);
    }
    log.i(displayCurrenciesList);
  }

//------------------------------------------------------------
  void newCurrenyTileAdd() async {
    displayCurrenciesList.add(currency.defaultCurrencies);
  }
}
