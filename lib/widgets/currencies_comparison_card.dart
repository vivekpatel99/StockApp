import 'package:StockApp/models/currency_model.dart';
import 'package:StockApp/models/user_input.dart';
import 'package:StockApp/widgets/currency_alert_popup.dart';
import 'package:StockApp/widgets/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrenciesComparisonCard extends StatelessWidget {
//  const CurrenciesComparisonCard({
//    Key key,
//  }) : super(key: key);
  final List<CurrenyType> currency;

  CurrenciesComparisonCard({this.currency});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 180,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 12.0,
            color: Color(0xFF1B1B1B),
            child: Row(
              children: <Widget>[
                CurrencyTextField(
                  controller: Provider.of<UserInput>(context, listen: false)
                      .textFieldController,
                  imagePath: currency[0].image,
                  currencyName: currency[0].currency,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.compare_arrows,
                          size: 80,
                          color: Color(0XFFAFAFAF),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        IconButton(
                          onPressed: () {
                            return showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CurrencyAlertPopup();
                              },
                            );
                          },
                          icon: Icon(
                            Icons.notifications,
                            size: 40,
                            color: Color(0XFFAFAFAF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CurrencyTextField(
                  controller: Provider.of<UserInput>(context, listen: false)
                      .textFieldController,
                  imagePath: currency[1].image,
                  currencyName: currency[1].currency,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
