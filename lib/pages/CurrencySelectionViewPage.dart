import 'package:StockApp/models/currency_model.dart';
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
                          currenyData: listViewSnap.data[2]);
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

class CurrencyListView extends StatelessWidget {
  const CurrencyListView({Key key, @required this.currenyData})
      : super(key: key);
  final List<CurrencyType> currenyData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: false,
      padding: EdgeInsets.only(left: 10, right: 10, top: 18, bottom: 18),
      itemCount: currenyData.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          shape: kCardShape,
          elevation: 10.0,
          child: ListTile(
            leading: CircleAvatar(
              radius: 18.0,
              backgroundImage: AssetImage(currenyData[index].image),
            ),
            title: Text(currenyData[index].currency),
            subtitle: Text(currenyData[index].name),
            onTap: () {},
          ),
        );
      },
    );
  }
}
