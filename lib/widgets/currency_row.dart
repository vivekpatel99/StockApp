import 'package:StockApp/globals.dart';
import 'package:StockApp/services/webservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'currencies_conversion.dart';

//------------------------------------------------------------------------------
class CurrencyRow extends StatefulWidget {
  final currenciesList;
  final int index;

  CurrencyRow({
    @required this.currenciesList,
    @required this.index,
  });

  @override
  _CurrencyRowState createState() => _CurrencyRowState();
}

//------------------------------------------------------------------------------
class _CurrencyRowState extends State<CurrencyRow> {
  double _userInput1;
  double _userInput2;
  var currDiff;
  bool inputEntered = false;
  TextEditingController currValUserInptController = TextEditingController();
  TextEditingController currValUserInptController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 5.0,
        bottom: 5.0,
      ),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(5.0, 5.0))],
      ),
      child: Column(
        children: <Widget>[
          iconsRow(),
          userInput(),
        ],
      ),
    );
  }

//------------------------------------------------------------------------------
  Row userInput() {
    return Row(
      // TextField Row
      children: <Widget>[
        SizedBox(
          // for First TextField
          width: 82,
        ),
        Container(
          width: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: TextField(
              style: currencyInputTextWidStyle,
              cursorColor: Colors.white,
              controller: currValUserInptController,
              obscureText: false,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration.collapsed(
                hintText: '0.0',
                hintStyle: currencyHintTextWidStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              //onTap: () => currValUserInptController.clear(),
              onSubmitted: (String userInput) {
                setState(
                  () async {
                    print(widget.currenciesList.addedCurrencies[widget.index]);
                    _userInput1 = double.parse(currValUserInptController.text);

                    currDiff =
                        await WebService().fetchCurrencyConversion('INR');
                    var outVal = CurrencyConversion().conversion(
                        sourceCurrency: _userInput1,
                        destCurrencyDiff: currDiff['INR']);

                    currValUserInptController2.text =
                        outVal.toStringAsFixed(currDecimal);
                  },
                );
              },
            ),
          ),
        ),
        SizedBox(
          // for Second TextField
          width: 88,
        ),
        Container(
          width: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: TextField(
              style: currencyInputTextWidStyle,
              controller: currValUserInptController2,
              obscureText: false,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration.collapsed(
                hintText: '0.0',
                hintStyle: currencyHintTextWidStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              //onTap: () => currValUserInptController2.clear(),
              onSubmitted: (String userInput) async {
                _userInput2 = double.parse(currValUserInptController2.text);

                var currDiff =
                    await WebService().fetchCurrencyConversion('INR');
                double outVal = CurrencyConversion().conversion(
                    sourceCurrency: _userInput2,
                    destCurrencyDiff: currDiff['EUR']);
                //double outVal = _userInput2 / currDiff['INR'];
                currValUserInptController.text =
                    outVal.toStringAsFixed(currDecimal);
              },
            ),
          ),
        ),
      ],
    );
  }

//------------------------------------------------------------------------------
  Row iconsRow() {
    return Row(
      // Icons Row
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        SizedBox(
          width: 5,
        ),
        Text(
          widget.currenciesList.addedCurrencies[widget.index]['name']
              [widget.index],
          style: currencyWidgetStyle,
        ),
        IconButton(
          icon: Image.asset(
            widget.currenciesList.addedCurrencies[widget.index]['image']
                [widget.index],
          ),
          onPressed: () {},
          iconSize: 80,
        ),
        Image.asset(
          'assets/images/bidirection.png',
          height: 70,
          width: 70,
        ),
        IconButton(
          icon: Image.asset(
            widget.currenciesList.addedCurrencies[widget.index]['image']
                [widget.index + 1],
          ),
          onPressed: () {},
          iconSize: 80,
        ),
        Text(
          widget.currenciesList.addedCurrencies[widget.index]['name']
              [widget.index + 1],
          style: currencyWidgetStyle,
        ),
        SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
