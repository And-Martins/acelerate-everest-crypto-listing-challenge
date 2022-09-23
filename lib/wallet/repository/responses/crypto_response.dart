import 'package:json_annotation/json_annotation.dart';
part 'crypto_response.g.dart';

@JsonSerializable()
class CryptoResponse {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final double currentPrice;
  final double marketCapChangePercentage24h;
  CryptoResponse({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCapChangePercentage24h,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'symbol': symbol});
    result.addAll({'name': name});
    result.addAll({'image': image});
    result.addAll({'current_price': currentPrice});
    result
        .addAll({'price_change_percentage_24h': marketCapChangePercentage24h});

    return result;
  }

  factory CryptoResponse.fromMap(Map<String, dynamic> map) {
    return CryptoResponse(
      id: map['id'] ?? '',
      symbol: map['symbol'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      currentPrice: map['current_price']?.toDouble() ?? 0.0,
      marketCapChangePercentage24h:
          map['price_change_percentage_24h']?.toDouble() ?? 0.0,
    );
  }

  factory CryptoResponse.fromJson(Map<String, dynamic> json) =>
      _$CriptoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CriptoResponseToJson(this);
}
