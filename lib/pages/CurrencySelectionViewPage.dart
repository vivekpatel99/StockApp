import 'package:StockApp/models/currency_model.dart';
import 'package:StockApp/others/mylog_printer.dart';
import 'package:StockApp/services/currency_service.dart';
import 'package:StockApp/widgets/currency_listview.dart';
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
    final CurrencySelectSide args = ModalRoute.of(context).settings.arguments;
    return Material(
      child: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: Card(
                margin: EdgeInsets.all(10),
                shape: kCardShape,
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
                      return CurrencyListView(
                          side: args.side, currenyData: listViewSnap.data[2]);
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
