import 'package:StockApp/models/home_pg_args_model.dart';
import 'package:StockApp/others/mylog_printer.dart';
import 'package:StockApp/services/webservice.dart';
import 'package:StockApp/widgets/currencies_comparison_card.dart';
import 'package:flutter/material.dart';

final log = getLogger('UserInput');

//==============================================================================
class UserInput extends ChangeNotifier {
  double _currencyInput;
  double _currencyOutput;
  // double _currencyValueDifference = 85.0;

  WebService currencyConv = WebService();
  List<CurrenciesComparisonCard> comparisionCardList = [];

  int listIndex = 0;
  int textFieldControllerIndex;

//------------------------------------------------------------------------------
  set userInputCurrencyValue(String userInput) {
    log.i('currencyInput = $userInput');
    _currencyInput = double.parse(userInput);
  }

//------------------------------------------------------------------------------
  get getComparisionCardListLength => comparisionCardList.length;

//------------------------------------------------------------------------------
  CurrenciesComparisonCard updateComparisionCardList(int index) {
    log.i('updateComparisionCardList - $index');
    listIndex = index;
    return comparisionCardList[index];
  }

  void outputCurrencyValue(
      {TextEditingController textEditingController,
      Future<double> currencyValueDifference}) async {
    if (_currencyInput != null) {
      _currencyOutput = _currencyInput * await currencyValueDifference;
      log.i(
          '$_currencyInput and $currencyValueDifference $textFieldControllerIndex');
      textEditingController.text = _currencyOutput.toStringAsFixed(2);
    }
  }

//------------------------------------------------------------------------------
  void addCurrenciesComparisonCard({Key key, HomePageArgs args}) {
    log.i('addCurrenciesComparisonCard');
    comparisionCardList.add(
      CurrenciesComparisonCard(
          key: ValueKey(comparisionCardList.length),
          currency: args.dfltcurrencyList),
    );

    log.i('addCurrenciesComparisonCard - $comparisionCardList');
    notifyListeners();
  }

//------------------------------------------------------------------------------
  void removeCurrenciesComparisonCard() {
    log.i('removeCurrenciesComparisonCard - $listIndex');
    comparisionCardList.removeAt(listIndex);
    notifyListeners();
  }
}
