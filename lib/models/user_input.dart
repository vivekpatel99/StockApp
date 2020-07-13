import 'package:flutter/cupertino.dart';

class UserInput extends ChangeNotifier {
  double currencyInput;
  double currencyOutput;
  double multiplier;

  TextEditingController textFieldController = TextEditingController();

//  void write

  String userInputCurrencyValue({String userInput}) {
    final currencyInput = double.parse(userInput);
    print(currencyInput);
    notifyListeners();
    return currencyInput.toStringAsFixed(2);
  }

  void outputCurrencyValue() {
    final currencyOutput = currencyInput * multiplier;
    print(currencyOutput);
    notifyListeners();
    textFieldController.text = currencyOutput.toStringAsFixed(2);
  }
}
