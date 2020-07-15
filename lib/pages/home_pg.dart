import 'package:StockApp/widgets/category_selector.dart';
import 'package:StockApp/widgets/currencies_comparison_card.dart';
import 'package:flutter/material.dart';

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
        onPressed: () {},
        backgroundColor: Color(0xFFBB86FC),
        child: Icon(Icons.add),
      ),
    );
  }
}
