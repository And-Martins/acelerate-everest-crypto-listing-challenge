// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'crypto_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoResponse _$CryptoResponseFromJson(Map<String, dynamic> json) =>
    CryptoResponse(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      currentPrice: (json['currentPrice'] as num).toDouble(),
      marketCapChangePercentage24h:
          (json['marketCapChangePercentage24h'] as num).toDouble(),
    );

Map<String, dynamic> _$CryptoResponseToJson(CryptoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'currentPrice': instance.currentPrice,
      'marketCapChangePercentage24h': instance.marketCapChangePercentage24h,
    };
