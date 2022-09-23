import 'package:decimal/decimal.dart';

class WalletModel {
  final double quantityCoin;
  final Decimal valueWalletCoin;
  final String idCoin;

  WalletModel({
    required this.quantityCoin,
    required this.valueWalletCoin,
    required this.idCoin,
  });
}
