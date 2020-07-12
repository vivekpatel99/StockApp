import 'dart:convert';

import 'package:http/http.dart' as http;

//https://exchangeratesapi.io/
class WebService {
  // TODO add check for Service unavailable

  Future<Map<String, dynamic>> fetchCurrencyConversion(
      String fromToCurreny) async {
    String _url =
        'https://api.exchangeratesapi.io/latest?symbols=$fromToCurreny';
    //'https://free.currconv.com/api/v7/convert?q=$fromToCurreny&compact=ultra&apiKey=764cec3a1e55dd765cce';

    final _response = await http.get(
      Uri.encodeFull(_url),
      headers: {'Accept': 'application/json'},
    );
    //Future.delayed(Duration(seconds: 2), () => throw Exception(0));

    if (_response.statusCode == 200) {
      var convertDataToJson = jsonDecode(_response.body);
      var _currencyVal = await convertDataToJson['rates'];

      return _currencyVal;
    } else {
      throw Exception(-1);
    }
  }
}
