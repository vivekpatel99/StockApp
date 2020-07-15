import 'dart:convert';

import 'package:StockApp/models/currency_load_model.dart';
import 'package:flutter/services.dart';

Future<String> _loadCurrencyAsset() async {
  return await rootBundle.loadString('assets/currencies.json');
}

Future loadCurrencies() async {
  String jsonCurrencies = await _loadCurrencyAsset();
  final jsonResponse = json.decode(jsonCurrencies);
  CurrencyLoadModel currency = CurrencyLoadModel.fromJson(jsonResponse);
  print(currency.defaultCurrencies[0].name);

  return currency;
}
