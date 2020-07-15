import 'package:StockApp/widgets/currency_alert_input.dart';
import 'package:flutter/material.dart';

class CurrencyAlertPopup extends StatelessWidget {
  // const CurrencyAlertPopup({
  //   Key key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 150,
        color: Color(0xFF1B1B1B),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: <Widget>[
              CurrencyAlertInput(
                inputTitle: 'Fall Below',
              ),
              SizedBox(
                width: 20,
              ),
              CurrencyAlertInput(
                inputTitle: 'Rise Above',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
