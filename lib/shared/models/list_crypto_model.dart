import 'dart:convert';

class CryptoModel {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final int currentPrice;
  final double marketCapChangePercentage24h;
  CryptoModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCapChangePercentage24h,
  });

  CryptoModel copyWith({
    String? id,
    String? symbol,
    String? name,
    String? image,
    int? currentPrice,
    double? marketCapChangePercentage24h,
  }) {
    return CryptoModel(
      id: id ?? this.id,
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      image: image ?? this.image,
      currentPrice: currentPrice ?? this.currentPrice,
      marketCapChangePercentage24h:
          marketCapChangePercentage24h ?? this.marketCapChangePercentage24h,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'symbol': symbol});
    result.addAll({'name': name});
    result.addAll({'image': image});
    result.addAll({'current_price': currentPrice});
    result.addAll(
        {'market_cap_change_percentage_24h': marketCapChangePercentage24h});

    return result;
  }

  factory CryptoModel.fromMap(Map<String, dynamic> map) {
    return CryptoModel(
      id: map['id'] ?? '',
      symbol: map['symbol'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      currentPrice: map['current_price']?.toInt() ?? 0,
      marketCapChangePercentage24h:
          map['market_cap_change_percentage_24h']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CryptoModel.fromJson(String source) =>
      CryptoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Listcryptodata(id: $id, symbol: $symbol, name: $name, image: $image, current_price: $currentPrice, market_cap_change_percentage_24h: $marketCapChangePercentage24h)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CryptoModel &&
        other.id == id &&
        other.symbol == symbol &&
        other.name == name &&
        other.image == image &&
        other.currentPrice == currentPrice &&
        other.marketCapChangePercentage24h == marketCapChangePercentage24h;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        symbol.hashCode ^
        name.hashCode ^
        image.hashCode ^
        currentPrice.hashCode ^
        marketCapChangePercentage24h.hashCode;
  }
}
