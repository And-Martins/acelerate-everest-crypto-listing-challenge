import 'package:decimal/decimal.dart';

class CryptoViewData {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final Decimal currentPrice;
  final double marketCapChangePercentage24h;

  CryptoViewData({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCapChangePercentage24h,
  });
}
