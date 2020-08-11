import 'package:StockApp/globals.dart';
import 'package:StockApp/models/currency_model.dart';
import 'package:StockApp/models/user_input_model.dart';
import 'package:StockApp/others/mylog_printer.dart';
import 'package:StockApp/pages/CurrencySelectionViewPage.dart';
import 'package:StockApp/services/webservice.dart';
import 'package:StockApp/widgets/currency_alert_popup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final log = getLogger('CurrenciesComparisonCard');

//==============================================================================
class CurrenciesComparisonCard extends StatelessWidget {
  final List<CurrencyTypeCard> currency;
  CurrenciesComparisonCard({
    this.currency,
    Key key,
  }) : super(key: key);

  final WebService webservice = WebService();
  final TextEditingController textEditingControllerLeft =
      TextEditingController();
  final TextEditingController textEditingControllerRight =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<UserInput>(builder: (context, inputData, child) {
      return Column(
        children: <Widget>[
          Container(
            height: 180,
            child: InkWell(
              onLongPress: () {
                log.i('CurrenciesComparisonCard - LongPressed');
                inputData.removeCurrenciesComparisonCard();
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 12.0,
                color: Color(0xFF1B1B1B),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            InkWell(
                              //TODO5 blur background when dialog show up
                              onTap: () {
                                print('onTap pressed');
                                Navigator.of(context).pushNamed(
                                  CurrencySelectionViewPage.id,
                                );
                              },
                              child: CircleAvatar(
                                radius: 25.0,
                                backgroundImage:
                                    AssetImage(currency[0].imageLeft),
                              ),
                            ),
                            Text(
                              currency[0].currencyLeft,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Container(
                              height: 50,
                              child: TextField(
                                key: key,
                                controller: textEditingControllerLeft,
                                onChanged: (value) =>
                                    inputData.userInputCurrencyValue = value,
                                onTap: () => textEditingControllerLeft.clear(),
                                onSubmitted: (String userInput) {
                                  final resultValue =
                                      webservice.fetchCurrencyConversion(
                                          '${currency[0].currencyLeft}_${currency[0].currencyRight}');
                                  inputData.outputCurrencyValue(
                                      textEditingController:
                                          textEditingControllerRight,
                                      currencyValueDifference: resultValue);
                                },
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: kAlertTextFieldDecoration,
                              ),
                            ),
                          ],
                        ),
                      ),
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            InkWell(
                              //TODO5 blur background when dialog show up
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(CurrencySelectionViewPage.id);
                              },
                              child: CircleAvatar(
                                radius: 25.0,
                                backgroundImage:
                                    AssetImage(currency[0].imageRight),
                              ),
                            ),
                            Text(
                              currency[0].currencyRight,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Container(
                              height: 50,
                              child: TextField(
                                key: key,
                                controller: textEditingControllerRight,
                                onChanged: (value) =>
                                    inputData.userInputCurrencyValue = value,
                                onTap: () => textEditingControllerRight.clear(),
                                onSubmitted: (String userInput) {
                                  Future<double> resultValue =
                                      webservice.fetchCurrencyConversion(
                                          '${currency[0].currencyRight}_${currency[0].currencyLeft}');
                                  inputData.outputCurrencyValue(
                                      textEditingController:
                                          textEditingControllerLeft,
                                      currencyValueDifference: resultValue);
                                },
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: kAlertTextFieldDecoration,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}
