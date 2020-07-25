import 'package:flutter/material.dart';

class UserInput extends ChangeNotifier {
  double _currencyInput = 0;
  double currencyOutput;
  double currencyValueDifference = 1.0;

  TextEditingController textFieldController = TextEditingController();
  TextEditingController textFieldController2 = TextEditingController();

  set userInputCurrencyValue(String userInput) {
    _currencyInput = double.parse(userInput);
    print('currencyInput = $_currencyInput');

    // return currencyInput.toStringAsFixed(2);
  }

  get outputCurrencyValueRight {
    print('outputCurrencyValueRight $_currencyInput');
    final currencyOutput = _currencyInput * currencyValueDifference;
    print('outputCurrencyValue');
    textFieldController2.text = currencyOutput.toStringAsFixed(2);
  }

  get outputCurrencyValueLeft {
    print('outputCurrencyValueLeft $_currencyInput');
    final currencyOutput = _currencyInput * currencyValueDifference;
    print('outputCurrencyValue');

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
