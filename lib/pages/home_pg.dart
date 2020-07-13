import 'package:flutter/material.dart';
import 'package:hello/globals.dart';
import 'package:hello/widgets/category_selector.dart';
import 'package:hello/widgets/currencies_comparison_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading:
            IconButton(icon: Icon(Icons.menu), iconSize: 30, onPressed: () {}),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
                tooltip: 'Next Choice',
                icon: const Icon(
                  Icons.add,
                  size: 30,
                ),
                onPressed: () {}),
          ),
        ],
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          CategorySelector(),
          Expanded(
            child: SingleChildScrollView(child: CurrenciesComparisonCard()),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // TODO blur background when dialog show up
        onPressed: () {
          return showDialog(
            context: context,
            builder: (BuildContext context) {
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
            },
          );
        },
        backgroundColor: Color(0xFFBB86FC),
        child: Icon(Icons.add),
      ),
    );
  }
}

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
