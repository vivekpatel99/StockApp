import 'package:flutter/material.dart';

class CurrencyTextField extends StatelessWidget {
  final String imagePath;
  final String currencyName;
  const CurrencyTextField(
      {@required this.imagePath, @required this.currencyName});

  @override
  Widget build(BuildContext context) {
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
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '0.0',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFBB86FC))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFAFAFAF))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
