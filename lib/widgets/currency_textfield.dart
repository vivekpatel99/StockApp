import 'package:flutter/material.dart';
import 'package:hello/globals.dart';
import 'package:hello/models/user_input.dart';
import 'package:provider/provider.dart';

class CurrencyTextField extends StatelessWidget {
  final String imagePath;
  final String currencyName;
  // var textFieldController = TextEditingController();

  CurrencyTextField({@required this.imagePath, @required this.currencyName});

  @override
  Widget build(BuildContext context) {
    // final userInputData =
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CircleAvatar(
              radius: 25.0,
              backgroundImage: AssetImage(imagePath),
            ),
            Text(
              currencyName,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              height: 50,
              child: TextField(
                controller: Provider.of<UserInput>(context, listen: false)
                    .textFieldController, //context.read<UserInput>().textFieldController,

                onChanged: (value) =>
                    context.read<UserInput>().userInputCurrencyValue(
                          userInput: value,
                        ),

                onTap: () => Provider.of<UserInput>(context, listen: false)
                    .textFieldController
                    .clear(),

                onSubmitted: (String userInput) {
                  context.read<UserInput>().outputCurrencyValue();
                },
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: kAlertTextFieldDecoration,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
