import 'dart:convert';

import 'package:flutter/foundation.dart';

class CryptoDetailModel {
  final List<double> prices;
  CryptoDetailModel({
    required this.prices,
  });

  CryptoDetailModel copyWith({
    List<double>? prices,
  }) {
    return CryptoDetailModel(
      prices: prices ?? this.prices,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'prices': prices});

    return result;
  }

  factory CryptoDetailModel.fromMap(Map<String, dynamic> map) {
    return CryptoDetailModel(
      prices: List<double>.from(map['prices']?.toDouble() ?? 00),
    );
  }

  String toJson() => json.encode(toMap());

  factory CryptoDetailModel.fromJson(String source) =>
      CryptoDetailModel.fromMap(json.decode(source));

  @override
  String toString() => 'CryptoDetailModel(prices: $prices)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CryptoDetailModel && listEquals(other.prices, prices);
  }

  @override
  int get hashCode => prices.hashCode;
}
