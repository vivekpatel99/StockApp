import 'dart:convert';

import 'package:StockApp/others/mylog_printer.dart';
import 'package:http/http.dart' as http;

final log = getLogger('WebService');

//==============================================================================
class WebService {
  double _currencyVal;

//------------------------------------------------------------------------------
  Future<double> fetchCurrencyConversion(String fromToCurreny) async {
    String _url =
        'https://free.currconv.com/api/v7/convert?q=$fromToCurreny&compact=ultra&apiKey=764cec3a1e55dd765cce';

    log.i('fetchCurrencyConversion - $_url');
    final _response = await http.get(
      Uri.encodeFull(_url),
      headers: {'Accept': 'application/json'},
    );

    if (_response.statusCode == 200) {
      var convertDataToJson = jsonDecode(_response.body);
      _currencyVal = await convertDataToJson[fromToCurreny];
      log.i('fetchCurrencyConversion - $_currencyVal');
      return _currencyVal;
    } else {
      throw Exception(-1);
    }
  }
}
