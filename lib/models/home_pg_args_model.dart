import 'package:StockApp/models/currency_model.dart';
import 'package:flutter/cupertino.dart';

class HomePageArgs {
  final List<CurrencyType> addedcurrencyList;
  final List<CurrencyType> dfltcurrencyList;

  HomePageArgs(
      {@required this.addedcurrencyList, @required this.dfltcurrencyList});
}
