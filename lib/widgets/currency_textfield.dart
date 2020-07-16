import 'package:StockApp/globals.dart';
import 'package:StockApp/models/user_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyTextField extends StatelessWidget {
  final String imagePath;
  final String currencyName;
  final TextEditingController controller;
  // var textFieldController = TextEditingController();

  CurrencyTextField(
      {@required this.imagePath,
      @required this.currencyName,
      @required this.controller});

  @override
  Widget build(BuildContext context) {
    // Provider.of<CurrencyModel>(context, listen: false).displayCurrencyTile();
    // print(Provider.of<CurrencyModel>(context, listen: false)
    //     .displayCurrenciesList
    //     .length);
    // return ListView.builder(
    //     itemCount: 1,
    //     itemBuilder: (context, index) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            InkWell(
              // TODO blur background when dialog show up
              onTap: () async {
                // var currenciesList = await loadCurrencies();
                // print(currenciesList.addedCurrencies.length);
                myListView();
              },
              child: CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage(imagePath),
              ),
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
                controller: controller,
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
    // }
    // );
  }
}

Widget myListView() {
  final europeanCountries = [
    'Albania',
    'Andorra',
    'Armenia',
    'Austria',
    'Azerbaijan',
    'Belarus',
    'Belgium',
    'Bosnia and Herzegovina',
    'Bulgaria',
    'Croatia',
    'Cyprus',
    'Czech Republic',
    'Denmark',
    'Estonia',
    'Finland',
    'France',
    'Georgia',
    'Germany',
    'Greece',
    'Hungary',
    'Iceland',
    'Ireland',
    'Italy',
    'Kazakhstan',
    'Kosovo',
    'Latvia',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Macedonia',
    'Malta',
    'Moldova',
    'Monaco',
    'Montenegro',
    'Netherlands',
    'Norway',
    'Poland',
    'Portugal',
    'Romania',
    'Russia',
    'San Marino',
    'Serbia',
    'Slovakia',
    'Slovenia',
    'Spain',
    'Sweden',
    'Switzerland',
    'Turkey',
    'Ukraine',
    'United Kingdom',
    'Vatican City'
  ];
  print('hrer');
  return ListView.builder(
      itemCount:
          europeanCountries.length, // currenciesList.addedCurrencies.length,
      itemBuilder: (context, int index) {
        print(europeanCountries[index]);
        return ListTile(title: Text(europeanCountries[index]));
        // CircleAvatar(
        //   radius: 12,
        //   backgroundImage: AssetImage(
        //       currenciesList.addedCurrencies[index].image),
        //   child: Text(currenciesList.addedCurrencies[index].name),
        // );
      });
}
