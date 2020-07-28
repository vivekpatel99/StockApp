import 'dart:convert';

import 'package:http/http.dart' as http;

class WebService {
  double _currencyVal;

  Future<double> fetchCurrencyConversion(String fromToCurreny) async {
    print('fetchCurrencyConversion');
    String _url =
        'https://free.currconv.com/api/v7/convert?q=$fromToCurreny&compact=ultra&apiKey=764cec3a1e55dd765cce';

    final _response = await http.get(
      Uri.encodeFull(_url),
      headers: {'Accept': 'application/json'},
    );
    // Future.delayed(Duration(seconds: 2), () => throw Exception(0));
    print(_response.body);
    if (_response.statusCode == 200) {
      var convertDataToJson = jsonDecode(_response.body);
      _currencyVal = await convertDataToJson[fromToCurreny];
      print(_currencyVal);

      return _currencyVal;
    } else {
      throw Exception(-1);
    }
  }
}
