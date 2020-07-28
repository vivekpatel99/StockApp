import 'package:StockApp/services/webservice.dart';
import 'package:flutter/material.dart';

class UserInput extends ChangeNotifier {
  double _currencyInput;
  double _currencyOutput;
  // double _currencyValueDifference = 85.0;

  WebService currencyConv = WebService();

  TextEditingController textFieldController = TextEditingController();
  TextEditingController textFieldController2 = TextEditingController();

  set userInputCurrencyValue(String userInput) {
    _currencyInput = double.parse(userInput);
    print('currencyInput = $_currencyInput');

    // return currencyInput.toStringAsFixed(2);
  }

  void outputCurrencyValueLeft(Future<double> _currencyValueDifference) async {
    print('outputCurrencyValue $_currencyInput and $_currencyValueDifference');
    _currencyOutput = _currencyInput * await _currencyValueDifference;
    textFieldController.text = _currencyOutput.toStringAsFixed(2);
  }

  void outputCurrencyValueRight(Future<double> _currencyValueDifference) async {
    print('outputCurrencyValue $_currencyInput and $_currencyValueDifference');
    _currencyOutput = _currencyInput * await _currencyValueDifference;
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
