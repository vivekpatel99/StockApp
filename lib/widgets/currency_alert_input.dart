import 'package:StockApp/globals.dart';
import 'package:flutter/material.dart';

class CurrencyAlertInput extends StatelessWidget {
  final String inputTitle;
  const CurrencyAlertInput({this.inputTitle});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            inputTitle,
            style: TextStyle(fontSize: 20),
          ),
          TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: kTextFieldDecoration,
          ),
        ],
      ),
    );
  }
}
