import 'package:StockApp/widgets/currency_alert_popup.dart';
import 'package:StockApp/widgets/currency_textfield.dart';
import 'package:flutter/material.dart';

class CurrenciesComparisonCard extends StatelessWidget {
//  const CurrenciesComparisonCard({
//    Key key,
//  }) : super(key: key);

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
                  imagePath: 'assets/images/eur.png',
                  currencyName: 'EUR',
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
                  imagePath: 'assets/images/inr.png',
                  currencyName: 'INR',
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
