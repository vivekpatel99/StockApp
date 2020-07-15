import 'package:flutter/material.dart';

class UserInput extends ChangeNotifier {
  double currencyInput;
  double currencyOutput;
  double currencyValueDifference;

  TextEditingController textFieldController = TextEditingController();

//  void write

  String userInputCurrencyValue({String userInput}) {
    final currencyInput = double.parse(userInput);
    notifyListeners();
    return currencyInput.toStringAsFixed(2);
  }

  void outputCurrencyValue() {
    final currencyOutput = currencyInput * currencyValueDifference;

    notifyListeners();
    textFieldController.text = currencyOutput.toStringAsFixed(2);
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
