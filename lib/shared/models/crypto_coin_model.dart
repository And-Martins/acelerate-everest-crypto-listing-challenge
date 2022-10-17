import 'prices_model.dart';

class CryptoCoinModel {
  final String base;
  final String baseId;
  final int unitPriceScale;
  final String currency;
  final PricesModel prices;

  CryptoCoinModel({
    required this.base,
    required this.baseId,
    required this.unitPriceScale,
    required this.currency,
    required this.prices,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'base': base});
    result.addAll({'base_id': baseId});
    result.addAll({'unit_price_scale': unitPriceScale});
    result.addAll({'currency': currency});
    result.addAll({'prices': prices.toMap()});

    return result;
  }

  factory CryptoCoinModel.fromMap(Map<String, dynamic> map) {
    return CryptoCoinModel(
      base: map['base'] ?? '',
      baseId: map['base_id'] ?? '',
      unitPriceScale: map['unit_price_scale']?.toInt() ?? 0,
      currency: map['currency'] ?? '',
      prices: PricesModel.fromMap(map['prices']),
    );
  }
}
