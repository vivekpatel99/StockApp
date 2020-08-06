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
  final List<CurrencyType> currency;

  CurrenciesComparisonCard({
    this.currency,
    Key key,
  }) : super(key: key);

  final WebService webservice = WebService();

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
                                backgroundImage: AssetImage(currency[0].image),
                              ),
                            ),
                            Text(
                              currency[0].currency,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Container(
                              height: 50,
                              child: TextField(
                                key: UniqueKey(),
                                controller: inputData.textFieldController,
                                onChanged: (value) =>
                                    inputData.userInputCurrencyValue = value,
                                onTap: () =>
                                    inputData.textFieldController.clear(),
                                onSubmitted: (String userInput) {
                                  final resultValue =
                                      webservice.fetchCurrencyConversion(
                                          '${currency[0].currency}_${currency[1].currency}');
                                  inputData
                                      .outputCurrencyValueRight(resultValue);
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
                                backgroundImage: AssetImage(currency[1].image),
                              ),
                            ),
                            Text(
                              currency[1].currency,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Container(
                              height: 50,
                              child: TextField(
                                key: UniqueKey(),
                                controller: inputData.textFieldController2,
                                onChanged: (value) =>
                                    inputData.userInputCurrencyValue = value,
                                onTap: () =>
                                    inputData.textFieldController2.clear(),
                                onSubmitted: (String userInput) {
                                  Future<double> resultValue =
                                      webservice.fetchCurrencyConversion(
                                          '${currency[1].currency}_${currency[0].currency}');
                                  inputData
                                      .outputCurrencyValueLeft(resultValue);
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
