class CryptoViewData {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final double currentPrice;
  final double marketCapChangePercentage24h;

  CryptoViewData({
    this.id = '',
    this.symbol = '',
    this.name = '',
    this.image = '',
    this.currentPrice = 0.0,
    this.marketCapChangePercentage24h = 0.0,
  });
}
