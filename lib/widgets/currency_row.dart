import 'package:StockApp/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyRow extends StatelessWidget {
  final Map<String, List<String>> currenciesList;
  final int index;
  const CurrencyRow({
    @required this.currenciesList,
    @required this.index,
  });

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                currenciesList['currencies'][index],
                style: currencyWidgetStyle,
              ),
              IconButton(
                icon: Image.asset(
                  currenciesList['images'][index],
                ),
                onPressed: () {},
                iconSize: 80,
              ),
              Image.asset(
                'assets/images/bidirection.png',
                height: 80,
                width: 80,
              ),
              IconButton(
                icon: Image.asset(
                  currenciesList['images'][index + 1],
                ),
                onPressed: () {},
                iconSize: 80,
              ),
              Text(
                currenciesList['currencies'][index + 1],
                style: currencyWidgetStyle,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 70,
              ),
              InputValue(),
              SizedBox(
                width: 11,
              ),
              InputValue(),
            ],
          ),
        ],
      ),
    );
  }
}

class InputValue extends StatefulWidget {
  const InputValue({
    Key key,
  }) : super(key: key);

  @override
  _InputValueState createState() => _InputValueState();
}

class _InputValueState extends State<InputValue> {
  TextEditingController currencyValUserInput = TextEditingController();
  String _userInput;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: TextField(
          controller: currencyValUserInput,
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
          onChanged: (String userInput) {
            setState(() {
              _userInput = currencyValUserInput.text;
              print('$_userInput');
            });
          },
        ),
      ),
    );
  }
}
