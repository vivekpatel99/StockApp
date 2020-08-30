import 'package:StockApp/globals.dart';
import 'package:StockApp/services/currency_service.dart';
import 'package:StockApp/widgets/currency_listview.dart';
import 'package:flutter/material.dart';

Future currencySelectionDialog({BuildContext context, bool side}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return FutureBuilder(
        future: Currency().loadInitCurrencies(),
        builder: (context, listViewSnap) {
          if (listViewSnap.connectionState == ConnectionState.none &&
              listViewSnap.hasError &&
              listViewSnap.data == null) {
            return Container();
          } else if (listViewSnap.connectionState == ConnectionState.done) {
            return CurrencyListView(
                side: side, currenyData: listViewSnap.data[2]);
          } else
            return kProgressIndicator;
        },
      );
    },
  );
}
