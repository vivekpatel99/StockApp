import 'package:hive/hive.dart';

part 'currency_watchlist_card_model.g.dart';

// cmd to autogenerate binary  'flutter packages pub run build_runner build'
//==============================================================================
@HiveType(typeId: 0)
class CurrencyWatchlistCard {
  @HiveField(0)
  final String nameLeft;

  @HiveField(1)
  final String currencyLeft;

  @HiveField(2)
  final String imageLeft;

  @HiveField(3)
  final String nameRight;

  @HiveField(4)
  final String currencyRight;

  @HiveField(5)
  final String imageRight;

  CurrencyWatchlistCard(
      {this.nameLeft,
      this.currencyLeft,
      this.imageLeft,
      this.nameRight,
      this.currencyRight,
      this.imageRight});

  factory CurrencyWatchlistCard.fromJson(Map<String, dynamic> parsedJson) {
    return CurrencyWatchlistCard(
        nameLeft: parsedJson['name_left'],
        currencyLeft: parsedJson['currency_left'],
        imageLeft: parsedJson['image_left'],
        nameRight: parsedJson['name_right'],
        currencyRight: parsedJson['currency_right'],
        imageRight: parsedJson['image_right']);
  }
}
