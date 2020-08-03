//------------------------------------------------------------------------------
// https://www.iban.com/exchange-rates
class CurrencyModel {
  final List<CurrencyType> defaultCurrencies;
  final List<CurrencyType> addedCurrencies;
  final List<CurrencyType> allCurrencies;

  CurrencyModel(
      {this.defaultCurrencies, this.addedCurrencies, this.allCurrencies});

//------------------------------------------------------------
  factory CurrencyModel.fromJson(Map<String, dynamic> parsedJson) {
    var dfltList = parsedJson['default'] as List;
    var addedList = parsedJson['added'] as List;
    var allList = parsedJson['all'] as List;

    List<CurrencyType> dfltCurrenyList =
        dfltList.map((e) => CurrencyType.fromJson(e)).toList();
    List<CurrencyType> addedCurrenyList =
        addedList.map((e) => CurrencyType.fromJson(e)).toList();
    List<CurrencyType> allCurrenyList =
        allList.map((e) => CurrencyType.fromJson(e)).toList();

    return CurrencyModel(
        defaultCurrencies: dfltCurrenyList,
        addedCurrencies: addedCurrenyList,
        allCurrencies: allCurrenyList);
  }
}

//------------------------------------------------------------------------------
class CurrencyType {
  String name;
  String currency;
  String image;

  CurrencyType({this.name, this.currency, this.image});

  factory CurrencyType.fromJson(Map<String, dynamic> parsedJson) {
    return CurrencyType(
        name: parsedJson['name'],
        currency: parsedJson['currency'],
        image: parsedJson['image']);
  }
}
