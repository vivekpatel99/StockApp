import 'package:StockApp/models/currency_watchlist_card_model.dart';
import 'package:StockApp/models/user_input_model.dart';
import 'package:StockApp/others/mylog_printer.dart';
import 'package:StockApp/pages/CurrencySelectionViewPage.dart';
import 'package:StockApp/pages/home_pg.dart';
import 'package:StockApp/pages/loading_pg.dart';
import 'package:StockApp/services/currency_service.dart';
import 'package:StockApp/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';
//TODO3 add Alert functionality
//TODO4  merge and push

//https://github.com/londonappbrewery/Flash-Chat-Flutter-Complete/blob/master/lib/main.dart
void main() async {
  Logger.level = Level.info;

  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();

  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(CurrencyWatchlistCardAdapter());
  await Hive.openBox<CurrencyWatchlistCard>(DatabaseService.watchlistcurrency);
  runApp(StockApp());
}

class StockApp extends StatelessWidget {
  final log = Logger(printer: MyLogPrinter('StockApp'));

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserInput>(create: (context) => UserInput()),
        ChangeNotifierProvider<Currency>(create: (context) => Currency()),
        ChangeNotifierProvider<DatabaseService>(
            create: (context) => DatabaseService()),
      ],
      child: MaterialApp(
        initialRoute: LoadingScreen.id,
        routes: {
          LoadingScreen.id: (context) => LoadingScreen(),
          HomePage.id: (context) => HomePage(),
          CurrencySelectionViewPage.id: (context) =>
              CurrencySelectionViewPage(),
        },
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
