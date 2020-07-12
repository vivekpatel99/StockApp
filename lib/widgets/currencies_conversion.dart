import 'package:flutter/cupertino.dart';

class CurrencyConversion {
  double conversion({
    @required double sourceCurrency,
    @required double destCurrencyDiff,
  }) {
    //print(
    //    'sourceCurrency= $sourceCurrency and destCurrencyDiff $destCurrencyDiff');
    return sourceCurrency * destCurrencyDiff;
  }
}

// INR = 85.2585 , USD = 1.1213 base EUR
// 1 INR = 1.1213/85.2585 = 0.013 USD
// 1 USD = 85.2585 / 1.1213 = 76.03540
