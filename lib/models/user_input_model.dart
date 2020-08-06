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
  TextEditingController textFieldController = TextEditingController();
  TextEditingController textFieldController2 = TextEditingController();

//------------------------------------------------------------------------------
  set userInputCurrencyValue(String userInput) {
    log.i('currencyInput = $userInput');
    _currencyInput = double.parse(userInput);

    // return currencyInput.toStringAsFixed(2);
  }

//------------------------------------------------------------------------------
  get getComparisionCardListLength => comparisionCardList.length;

//------------------------------------------------------------------------------
  CurrenciesComparisonCard updateComparisionCardList(int index) {
    log.i('updateComparisionCardList - $index');
    listIndex = index;
    return comparisionCardList[index];
  }

//------------------------------------------------------------------------------
  void outputCurrencyValueLeft(Future<double> _currencyValueDifference) async {
    if (_currencyInput != null) {
      _currencyOutput = _currencyInput * await _currencyValueDifference;
      log.i('$_currencyInput and $_currencyValueDifference');
      textFieldController.text = _currencyOutput.toStringAsFixed(2);
    }
  }

//------------------------------------------------------------------------------
  void outputCurrencyValueRight(Future<double> _currencyValueDifference) async {
    if (_currencyInput != null) {
      _currencyOutput = _currencyInput * await _currencyValueDifference;
      log.i('$_currencyInput and $_currencyValueDifference');
      textFieldController2.text = _currencyOutput.toStringAsFixed(2);
    }
  }

//------------------------------------------------------------------------------
  void addCurrenciesComparisonCard({HomePageArgs args}) {
    log.i('addCurrenciesComparisonCard');
    comparisionCardList.add(
      CurrenciesComparisonCard(currency: args.dfltcurrencyList),
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

// import 'package:flutter/cupertino.dart';

// class Currency {
//   double conversion({
//     @required double sourceCurrency,
//     @required double destCurrencyDiff,
//   }) {
//     print(
//         'sourceCurrency= $sourceCurrency and destCurrencyDiff $destCurrencyDiff');
//     return sourceCurrency * destCurrencyDiff;
//   }
// }
