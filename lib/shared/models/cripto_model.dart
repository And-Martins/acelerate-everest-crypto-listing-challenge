class CriptoModel {
  final String abbreviation;
  final String name;
  final double valueWalletCripto;
  final double valueQtdWalletCripto;
  final String image;
  final double cotacao;
  final double variacao;

  CriptoModel({
    required this.abbreviation,
    required this.name,
    required this.valueWalletCripto,
    required this.valueQtdWalletCripto,
    required this.image,
    required this.cotacao,
    required this.variacao,
  });
}
