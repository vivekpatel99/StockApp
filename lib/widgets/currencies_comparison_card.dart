import 'package:StockApp/globals.dart';
import 'package:StockApp/models/currency_watchlist_card_model.dart';
import 'package:StockApp/models/user_input_model.dart';
import 'package:StockApp/others/mylog_printer.dart';
import 'package:StockApp/services/webservice.dart';
import 'package:StockApp/widgets/currency_alert_popup.dart';
import 'package:StockApp/widgets/currency_selection_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final log = getLogger('CurrenciesComparisonCard');

//==============================================================================
class CurrenciesComparisonCard extends StatefulWidget {
  final CurrencyWatchlistCard currency;

  CurrenciesComparisonCard({
    this.currency,
    Key key,
  }) : super(key: key);

  static const bool kRightSide = true;
  static const bool kLeftSide = false;

  @override
  _CurrenciesComparisonCardState createState() =>
      _CurrenciesComparisonCardState();
}

class _CurrenciesComparisonCardState extends State<CurrenciesComparisonCard> {
  final WebService webservice = WebService();

  final TextEditingController textEditingControllerLeft =
      TextEditingController();

  final TextEditingController textEditingControllerRight =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserInput>(
      builder: (context, inputData, child) {
        return Column(
          children: <Widget>[
            Container(
              height: 180,
              child: Card(
                key: widget.key,
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
                                currencySelectionDialog(
                                    context: context,
                                    side: CurrenciesComparisonCard.kRightSide);
                              },
                              child: CircleAvatar(
                                radius: 25.0,
                                backgroundImage:
                                    AssetImage(widget.currency.imageLeft),
                              ),
                            ),
                            Text(
                              widget.currency.currencyLeft,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Container(
                              height: 50,
                              child: TextField(
                                controller: textEditingControllerLeft,
                                onChanged: (value) =>
                                    inputData.userInputCurrencyValue = value,
                                onTap: () => textEditingControllerLeft.clear(),
                                onSubmitted: (String userInput) {
                                  final resultValue =
                                      webservice.fetchCurrencyConversion(
                                          '${widget.currency.currencyLeft}_${widget.currency.currencyRight}');
                                  inputData.outputCurrencyValue(
                                      txtEditController:
                                          textEditingControllerRight,
                                      currencyValDiff: resultValue);
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
                              icon: const Icon(
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
                                currencySelectionDialog(
                                    context: context,
                                    side: CurrenciesComparisonCard.kLeftSide);
                              },
                              child: CircleAvatar(
                                radius: 25.0,
                                backgroundImage:
                                    AssetImage(widget.currency.imageRight),
                              ),
                            ),
                            Text(
                              widget.currency.currencyRight,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Container(
                              height: 50,
                              child: TextField(
                                controller: textEditingControllerRight,
                                onChanged: (value) =>
                                    inputData.userInputCurrencyValue = value,
                                onTap: () => textEditingControllerRight.clear(),
                                onSubmitted: (String userInput) {
                                  Future<double> resultValue =
                                      webservice.fetchCurrencyConversion(
                                          '${widget.currency.currencyRight}_${widget.currency.currencyLeft}');
                                  inputData.outputCurrencyValue(
                                      txtEditController:
                                          textEditingControllerLeft,
                                      currencyValDiff: resultValue);
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
          ],
        );
      },
    );
  }
}
