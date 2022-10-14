class TransactionModel {
  DateTime date;
  double fromCryptoQtd;
  String fromCryptoAbrev;
  double toCryptoQtd;
  String toCryptoAbrev;
  double valueReais;

  TransactionModel({
    required this.date,
    required this.fromCryptoQtd,
    required this.fromCryptoAbrev,
    required this.toCryptoQtd,
    required this.toCryptoAbrev,
    required this.valueReais,
  });
}
