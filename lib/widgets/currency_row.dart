import 'package:StockApp/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//------------------------------------------------------------------------------
class CurrencyRow extends StatefulWidget {
  final Map<String, List<String>> currenciesList;
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
  var _userInput1;
  var _userInput2;

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                width: 5,
              ),
              Text(
                widget.currenciesList['currencies'][widget.index],
                style: currencyWidgetStyle,
              ),
              IconButton(
                icon: Image.asset(
                  widget.currenciesList['images'][widget.index],
                ),
                onPressed: () {
                  _print();
                },
                iconSize: 80,
              ),
              Image.asset(
                'assets/images/bidirection.png',
                height: 70,
                width: 70,
              ),
              IconButton(
                icon: Image.asset(
                  widget.currenciesList['images'][widget.index + 1],
                ),
                onPressed: () {},
                iconSize: 80,
              ),
              Text(
                widget.currenciesList['currencies'][widget.index + 1],
                style: currencyWidgetStyle,
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 78,
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
                    controller: currValUserInptController,
                    obscureText: false,
                    textAlign: TextAlign.center,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration.collapsed(
                      hintText: '0.0',
                      hintStyle: currencyHintTextWidStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onTap: () => currValUserInptController.clear(),
                    onSubmitted: (String userInput) {
                      setState(
                        () {
                          _userInput1 = currValUserInptController.text;
                          currValUserInptController2.text = _userInput1;
                        },
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 96,
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
                    controller: currValUserInptController2,
                    obscureText: false,
                    textAlign: TextAlign.center,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration.collapsed(
                      hintText: '0.0',
                      hintStyle: currencyHintTextWidStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onTap: () => currValUserInptController2.clear(),
                    onSubmitted: (String userInput) {
                      setState(
                        () {
                          _userInput2 = currValUserInptController2.text;

                          currValUserInptController.text = _userInput2;
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _print() {
    print('userinput1 "$_userInput1"');
  }
}
