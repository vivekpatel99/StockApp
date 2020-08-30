import 'package:StockApp/globals.dart';
import 'package:StockApp/models/currency_model.dart';
import 'package:StockApp/models/user_input_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyListView extends StatelessWidget {
  const CurrencyListView(
      {Key key, @required this.currenyData, @required this.side})
      : super(key: key);
  final List<CurrencyType> currenyData;
  final bool side;
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
            onTap: () {
              final _index =
                  Provider.of<UserInput>(context, listen: false).getCardIndex;

              if (side == true) {
                print('Left side clicked $_index');

                print(currenyData[index].currency);
                return;
              } else {}
              print('Right side clicked $index');
              print(currenyData[index].currency);
              return;
            },
          ),
        );
      },
    );
  }
}
