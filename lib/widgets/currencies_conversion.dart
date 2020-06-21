import 'package:flutter/cupertino.dart';

class Currency {
  double conversion({
    @required double sourceCurrency,
    @required double destCurrencyDiff,
  }) {
    print(
        'sourceCurrency= $sourceCurrency and destCurrencyDiff $destCurrencyDiff');
    return sourceCurrency * destCurrencyDiff;
  }
}
