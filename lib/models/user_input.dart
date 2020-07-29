import 'package:StockApp/others/mylog_printer.dart';
import 'package:StockApp/services/webservice.dart';
import 'package:flutter/material.dart';

final log = getLogger('UserInput');

//==============================================================================
class UserInput extends ChangeNotifier {
  double _currencyInput;
  double _currencyOutput;
  // double _currencyValueDifference = 85.0;

  WebService currencyConv = WebService();

  TextEditingController textFieldController = TextEditingController();
  TextEditingController textFieldController2 = TextEditingController();

//------------------------------------------------------------------------------
  set userInputCurrencyValue(String userInput) {
    log.i('currencyInput = $userInput');
    _currencyInput = double.parse(userInput);

    // return currencyInput.toStringAsFixed(2);
  }

//------------------------------------------------------------------------------
  void outputCurrencyValueLeft(Future<double> _currencyValueDifference) async {
    _currencyOutput = _currencyInput * await _currencyValueDifference;
    log.i('$_currencyInput and $_currencyValueDifference');
    textFieldController.text = _currencyOutput.toStringAsFixed(2);
  }

//------------------------------------------------------------------------------
  void outputCurrencyValueRight(Future<double> _currencyValueDifference) async {
    _currencyOutput = _currencyInput * await _currencyValueDifference;
    log.i('$_currencyInput and $_currencyValueDifference');
    textFieldController2.text = _currencyOutput.toStringAsFixed(2);
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
