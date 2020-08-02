import 'package:StockApp/models/currency_selection_args_mode.dart';
import 'package:StockApp/others/mylog_printer.dart';
import 'package:StockApp/services/currencyservice.dart';
import 'package:flutter/material.dart';

import '../globals.dart';

final log = getLogger('CurrencySelectionViewPage');

class CurrencySelectionViewPage extends StatefulWidget {
  static const String id = 'currency_selectionview_page';
  @override
  _CurrencySelectionViewState createState() => _CurrencySelectionViewState();
}

class _CurrencySelectionViewState extends State<CurrencySelectionViewPage> {
  @override
  Widget build(BuildContext context) {
    final CurrencySelectionPageArgs args =
        ModalRoute.of(context).settings.arguments;
    return Material(
      child: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 12.0,
                child: FutureBuilder(
                  future: Currency().loadInitCurrencies(),
                  builder: (context, listViewSnap) {
                    if (listViewSnap.connectionState == ConnectionState.none &&
                        listViewSnap.hasError &&
                        listViewSnap.data == null) {
                      return Container();
                    } else if (listViewSnap.connectionState ==
                        ConnectionState.done) {
                      return ListView.builder(
                        itemCount: listViewSnap.data[2].length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(listViewSnap.data[2][index].name),
                          );
                        },
                      );
                    } else
                      return kProgressIndicator;
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
