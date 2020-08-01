import 'package:flutter/material.dart';

// class CurrencyTextField extends StatelessWidget {
//   final String imagePath;
//   final String currencyName;
//   final TextEditingController controller;
//   final bool conversionFrom;
//   // var textFieldController = TextEditingController();

//   CurrencyTextField(
//       {@required this.imagePath,
//       @required this.currencyName,
//       @required this.controller,
//       @required this.conversionFrom});

//   @override
//   Widget build(BuildContext context) {
//     // Provider.of<CurrencyModel>(context, listen: false).displayCurrencyTile();
//     // print(Provider.of<CurrencyModel>(context, listen: false)
//     //     .displayCurrenciesList
//     //     .length);
//     // return ListView.builder(
//     //     itemCount: 1,
//     //     itemBuilder: (context, index) {
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: <Widget>[
//             InkWell(
//               //TODO5 blur background when dialog show up
//               onTap: () async {
//                 // var currenciesList = await loadCurrencies();
//                 // print(currenciesList.addedCurrencies.length);
//                 myListView();
//               },
//               child: CircleAvatar(
//                 radius: 25.0,
//                 backgroundImage: AssetImage(imagePath),
//               ),
//             ),
//             Text(
//               currencyName,
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 8.0,
//             ),
//             Container(
//               height: 50,
//               child: TextField(
//                 controller: controller,
//                 onChanged: (value) =>
//                     context.read<UserInput>().userInputCurrencyValue = value,
//                 onTap: () => controller.clear(),
//                 onSubmitted: (String userInput) {
//                   context
//                       .read<UserInput>()
//                       .outputCurrencyValue(conversionFrom: conversionFrom);
//                   print(userInput);
//                 },
//                 textAlign: TextAlign.center,
//                 keyboardType: TextInputType.number,
//                 decoration: kAlertTextFieldDecoration,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//     // }
//     // );
//   }
// }
const List<String> europeanCountries = [
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

class CurrencySelectionView extends StatefulWidget {
  static const String id = 'currency_selectionview_page';
  @override
  _CurrencySelectionViewState createState() => _CurrencySelectionViewState();
}

class _CurrencySelectionViewState extends State<CurrencySelectionView> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 12.0,
                child: ListView.builder(
                    itemCount: europeanCountries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(europeanCountries[index]),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
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
  print('herer');
  Widget _getListItemTile(BuildContext context, int index) {
    print('herer');
    return Scaffold(
      body: Material(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 4),
          // color:
          //     europeanCountries[index].isSelected ? Colors.red[100] : Colors.white,
          child: ListTile(
            title: Text(europeanCountries[index]),
          ),
        ),
      ),
    );
  }

  return ListView.builder(
    itemCount:
        europeanCountries.length, // currenciesList.addedCurrencies.length,
    itemBuilder: (BuildContext context, int index) {
      return Scaffold(
        body: Material(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 4),
            // color:
            //     europeanCountries[index].isSelected ? Colors.red[100] : Colors.white,
            child: ListTile(
              title: Text(europeanCountries[index]),
            ),
          ),
        ),
      );
    },
    // CircleAvatar(
    //   radius: 12,
    //   backgroundImage: AssetImage(
    //       currenciesList.addedCurrencies[index].image),
    //   child: Text(currenciesList.addedCurrencies[index].name),
    // );
  );
}
