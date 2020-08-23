import 'dart:convert';

import 'package:StockApp/models/currency_model.dart';
import 'package:StockApp/models/currency_watchlist_card_model.dart';
import 'package:StockApp/others/mylog_printer.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:localstorage/localstorage.dart';

final log = getLogger('DatabaseService');

//==============================================================================
class DatabaseService extends ChangeNotifier {
  /* Handle JSON database */
  static LocalStorage storage = LocalStorage('database');
  static const String watchlistcurrency = 'watchlistCurrencies';
  Box currencyWatchListBox;
//------------------------------------------------------------------------------
  Future openHiveBox() async {
    //Hive tutorial   https://www.youtube.com/watch?v=R1GSrrItqUs&list=WL&index=23&t=1808s

    currencyWatchListBox =
        await Hive.openBox<CurrencyWatchlistCard>(watchlistcurrency);
    // notifyListeners();
  }

//------------------------------------------------------------------------------
  Future<CurrencyTypeCard> getCurrency(int cardIndex) async {
    log.i('getCurrency');
    var currency = await getCurrencyFromCache(cardIndex);
    log.i('getCurrency - $currency');
    return currency;
  }

//------------------------------------------------------------------------------
  Future<CurrencyTypeCard> getCurrencyFromCache(int cardIndex) async {
    log.i('getCurrencyFromCache');
    CurrencyTypeCard currency = CurrencyTypeCard();
    await storage.ready;
    currency = getItemFromDatabase(cardIndex);
    notifyListeners();
    return currency;
  }

//------------------------------------------------------------------------------
  CurrencyTypeCard getItemFromDatabase(int index) {
    CurrencyTypeCard currency = CurrencyTypeCard();
    try {
      var data = json.decode(storage.getItem('$index'));
      if (data == null) return null;

      currency.nameLeft = data['name_left'];
      currency.currencyLeft = data['currency_left'];
      currency.imageLeft = data['image_left'];
      currency.nameRight = data['name_right'];
      currency.currencyRight = data['currency_right'];
      currency.imageRight = data['image_right'];
    } catch (err, stacktrace) {
      log.e([err, stacktrace]);
    }
    return currency;
  }

//------------------------------------------------------------------------------
  void saveCurrency({CurrencyWatchlistCard currency, int cardIndex}) async {
    log.i('saveCurrency $cardIndex');
    // await storage.ready;
    // storage.setItem('$cardIndex', jsonEncode(currency));

    // final watchlistCurrencyBox = Hive.box(watchlistcurrency);
    currencyWatchListBox.add(currency);
    log.i('Currency saved');
    notifyListeners();
  }

//------------------------------------------------------------------------------
  // void deleteCurrency(int cardIndex) async {
  //   log.i('deleteCurrency');
  //   await storage.ready;
  //   storage.deleteItem('$cardIndex');
  //   notifyListeners();
  // }
}
