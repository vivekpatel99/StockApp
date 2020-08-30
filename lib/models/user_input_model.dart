import 'package:StockApp/models/currency_watchlist_card_model.dart';
import 'package:StockApp/models/home_pg_args_model.dart';
import 'package:StockApp/others/mylog_printer.dart';
import 'package:StockApp/services/database_service.dart';
import 'package:StockApp/services/webservice.dart';
import 'package:StockApp/widgets/currencies_comparison_card.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

final log = getLogger('UserInput');

//==============================================================================
class UserInput extends ChangeNotifier {
  double _currencyInput;
  double _currencyOutput;
  // double _currencyValueDifference = 85.0;

  WebService currencyConv = WebService();

  int listIndex = 0;
  int currentListIndex;

  Box<CurrencyWatchlistCard> newCurrencyBox;
  static const kRightSide = true;
  static const kLeftSide = false;

//------------------------------------------------------------------------------
  loadDataFromDatabase() {
    // await DatabaseService.storage.ready;
    // List<CurrencyTypeCard> card = List<CurrencyTypeCard>.from((card as List).map((curreny)))
  }

//------------------------------------------------------------------------------
  set userInputCurrencyValue(String userInput) {
    log.i('currencyInput = $userInput');
    _currencyInput = double.parse(userInput);
    notifyListeners();
  }

//------------------------------------------------------------------------------
  get getCardIndex => listIndex;

// //------------------------------------------------------------------------------
// ListView _builderListView(){
//   final currencyBox =
//                           Hive.box(DatabaseService.watchlistcurrency);
//                       return ListView.builder(
//                         itemCount: snapshot.data.length,
//                         itemBuilder: inputData.getListItemCard,
//                       );
// }
//------------------------------------------------------------------------------
  ValueListenableBuilder<Box<CurrencyWatchlistCard>>
      buildValueListenableBuilder() {
    return ValueListenableBuilder(
        valueListenable:
            Hive.box<CurrencyWatchlistCard>(DatabaseService.watchlistcurrency)
                .listenable(),
        builder: (context, Box<CurrencyWatchlistCard> currencyBox, _) {
          newCurrencyBox = currencyBox;
          return ListView.builder(
            itemCount: currencyBox.values.length,
            itemBuilder: (BuildContext context, int index) {
              listIndex = index;
              final CurrencyWatchlistCard currency = currencyBox.getAt(index);
              return InkWell(
                onLongPress: () => removeCard(index),
                child: CurrenciesComparisonCard(
                    key: ObjectKey(currency), currency: currency),
              );
            },
          );
        });
  }

//------------------------------------------------------------------------------
  // Widget getListItemCard(BuildContext contex, int index) {
  //   // final CurrencyTypeCard currency = currencyBox.getAt(index);
  //   // return InkWell(
  //   //   onLongPress: () => {},
  //   //   child: CurrenciesComparisonCard(currency: currency),
  //   // );

  //   // listIndex = index;
  //   // final watchlistCurrencyBox = Hive.box('watchlistcurrency');
  //   // final currency = watchlistCurrencyBox.getAt(index);
  //   // return InkWell(
  //   //   onLongPress: () => removeCard(comparisionCardList[index]),
  //   //   child: CurrenciesComparisonCard(currency: currency),
  //   // );
  // }

//------------------------------------------------------------------------------
  void removeCard(int index) {
    log.i('CurrenciesComparisonCard - LongPressed');
    newCurrencyBox.deleteAt(index);
    notifyListeners();
  }

//------------------------------------------------------------------------------
  void outputCurrencyValue(
      {TextEditingController txtEditController,
      Future<double> currencyValDiff}) async {
    if (_currencyInput != null) {
      _currencyOutput = _currencyInput * await currencyValDiff;
      log.i(
          'input currency: $_currencyInput and currencyDifference: $currencyValDiff');
      txtEditController.text = _currencyOutput.toStringAsFixed(2);
    }
    notifyListeners();
  }

//------------------------------------------------------------------------------
  void addCurrenciesComparisonCard({HomePageArgs args}) {
    log.i('addCurrenciesComparisonCard');

    CurrencyWatchlistCard currencyCard = CurrencyWatchlistCard(
      nameLeft: args.dfltcurrencyList[0].nameLeft,
      currencyLeft: args.dfltcurrencyList[0].currencyLeft,
      imageLeft: args.dfltcurrencyList[0].imageLeft,
      nameRight: args.dfltcurrencyList[0].nameRight,
      currencyRight: args.dfltcurrencyList[0].currencyRight,
      imageRight: args.dfltcurrencyList[0].imageRight,
    );

    newCurrencyBox.add(currencyCard);
    log.i('Currency saved');
    log.i('addCurrenciesComparisonCard end');
    notifyListeners();
  }
}
