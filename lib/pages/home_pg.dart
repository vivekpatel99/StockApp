import 'package:StockApp/globals.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: IconButton(
                  tooltip: 'Next Choice',
                  icon: const Icon(
                    Icons.add,
                    size: 40,
                  ),
                  onPressed: () {}),
            ),
          ],
        ),
        body: Row(
          children: <Widget>[
            Container(
              child: Center(
                child: Text(
                  'Currency 1',
                  style: homeSubTitleStyle,
                ),
              ),
              width: MediaQuery.of(context).size.width / 2,
              height: 40,
            ),
            Container(
              child: Center(
                child: Text(
                  'Currency 2',
                  style: homeSubTitleStyle,
                ),
              ),
              width: MediaQuery.of(context).size.width / 2,
              height: 40,
            )
          ],
        ));
  }
}
