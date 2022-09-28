class CryptoListModel {
  final String base;
  final String baseId;
  final int unitPriceScale;
  final String currency;

  CryptoListModel({
    required this.base,
    required this.baseId,
    required this.unitPriceScale,
    required this.currency,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'base': base});
    result.addAll({'base_id': baseId});
    result.addAll({'unit_price_scale': unitPriceScale});
    result.addAll({'currency': currency});

    return result;
  }

  factory CryptoListModel.fromMap(Map<String, dynamic> map) {
    return CryptoListModel(
      base: map['base'] ?? '',
      baseId: map['base_id'] ?? '',
      unitPriceScale: map['unit_price_scale']?.toInt() ?? 0,
      currency: map['currency'] ?? '',
    );
  }
}
