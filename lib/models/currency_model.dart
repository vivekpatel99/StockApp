//==============================================================================
// https://www.iban.com/exchange-rates

class CurrencyModel {
  final List<CurrencyTypeCard> defaultCurrencies;
  final List<CurrencyType> addedCurrencies;
  final List<CurrencyType> allCurrencies;

  CurrencyModel(
      {this.defaultCurrencies, this.addedCurrencies, this.allCurrencies});

//------------------------------------------------------------
  factory CurrencyModel.fromJson(Map<String, dynamic> parsedJson) {
    var dfltList = parsedJson['default'] as List;
    var addedList = parsedJson['added'] as List;
    var allList = parsedJson['all'] as List;

    List<CurrencyTypeCard> dfltCurrenyList =
        dfltList.map((e) => CurrencyTypeCard.fromJson(e)).toList();
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

//==============================================================================
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

//==============================================================================
class CurrencyTypeCard {
  String nameLeft;
  String currencyLeft;
  String imageLeft;
  String nameRight;
  String currencyRight;
  String imageRight;
  CurrencyTypeCard(
      {this.nameLeft,
      this.currencyLeft,
      this.imageLeft,
      this.nameRight,
      this.currencyRight,
      this.imageRight});

  factory CurrencyTypeCard.fromJson(Map<String, dynamic> parsedJson) {
    return CurrencyTypeCard(
        nameLeft: parsedJson['name_left'],
        currencyLeft: parsedJson['currency_left'],
        imageLeft: parsedJson['image_left'],
        nameRight: parsedJson['name_right'],
        currencyRight: parsedJson['currency_right'],
        imageRight: parsedJson['image_right']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name_left': nameLeft,
      'currency_left': currencyLeft,
      'image_left': imageLeft,
      'name_right': nameRight,
      'currency_right': currencyRight,
      'image_right': imageRight,
    };
  }
}

//==============================================================================
class CurrencySelectSide {
  final bool side; // is true = right, false = left
  CurrencySelectSide({this.side});
}
