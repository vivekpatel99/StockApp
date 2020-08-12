import 'package:StockApp/models/currency_model.dart';
import 'package:flutter/widgets.dart';
import 'package:localstorage/localstorage.dart';

//==============================================================================
class DatabaseService extends ChangeNotifier {
  /* Handle JSON database */
  static LocalStorage storage = LocalStorage('database');
//------------------------------------------------------------------------------
  Future<CurrencyTypeCard> getCurrency(int cardIndex) async {
    var currency = await getCurrencyFromCache(cardIndex);
    if (currency == null) return null;
    return currency;
  }

//------------------------------------------------------------------------------
  Future<CurrencyTypeCard> getCurrencyFromCache(int cardIndex) async {
    await storage.ready;
    Map<String, dynamic> data = storage.getItem('$cardIndex');
    if (data == null) return null;

    CurrencyTypeCard currency = CurrencyTypeCard.fromJson(data);
    return currency;
  }

//------------------------------------------------------------------------------
  void saveCurrency({CurrencyTypeCard currency, int cardIndex}) async {
    await storage.ready;
    storage.setItem('$cardIndex', currency);
  }

//------------------------------------------------------------------------------
  void deleteCurrency(int cardIndex) async {
    await storage.ready;
    storage.deleteItem('$cardIndex');
  }
}
