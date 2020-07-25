/* class Currency_ extends ChangeNotifier {
  CurrencyModel currency;
  List<List<CurrenyType>> displayCurrenciesList = [];

//------------------------------------------------------------
  // static Future<CurrencyModel> create() async {
  //   CurrencyModel currency = Currency._();
  //   currency = await loadCurrencies();

  //   return currency;
  // }

//------------------------------------------------------------
  void displayCurrencyTile() async {
    // setUp();
    print(currency.addedCurrencies[0].name);
    if (currency.addedCurrencies.isNotEmpty) {
      displayCurrenciesList.add(currency.addedCurrencies);
    }
    print(displayCurrenciesList);
  }

//------------------------------------------------------------
  void newCurrenyTileAdd() {
    displayCurrenciesList.add(currency.defaultCurrencies);
  }
} */
