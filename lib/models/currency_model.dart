//------------------------------------------------------------------------------
// https://www.iban.com/exchange-rates
class CurrencyModel {
  final List<CurrenyType> defaultCurrencies;
  final List<CurrenyType> addedCurrencies;
  final List<CurrenyType> allCurrencies;

  CurrencyModel(
      {this.defaultCurrencies, this.addedCurrencies, this.allCurrencies});

//------------------------------------------------------------
  factory CurrencyModel.fromJson(Map<String, dynamic> parsedJson) {
    var dfltList = parsedJson['default'] as List;
    var addedList = parsedJson['added'] as List;
    var allList = parsedJson['all'] as List;

    List<CurrenyType> dfltCurrenyList =
        dfltList.map((e) => CurrenyType.fromJson(e)).toList();
    List<CurrenyType> addedCurrenyList =
        addedList.map((e) => CurrenyType.fromJson(e)).toList();
    List<CurrenyType> allCurrenyList =
        allList.map((e) => CurrenyType.fromJson(e)).toList();

    return CurrencyModel(
        defaultCurrencies: dfltCurrenyList,
        addedCurrencies: addedCurrenyList,
        allCurrencies: allCurrenyList);
  }
}

//------------------------------------------------------------------------------
class CurrenyType {
  final String name;
  final String currency;
  final String image;

  CurrenyType({this.name, this.currency, this.image});

  factory CurrenyType.fromJson(Map<String, dynamic> parsedJson) {
    return CurrenyType(
        name: parsedJson['name'],
        currency: parsedJson['currency'],
        image: parsedJson['image']);
  }
}
