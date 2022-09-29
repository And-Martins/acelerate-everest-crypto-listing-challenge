import 'package:dio/dio.dart';

class CryptoEndpoint {
  final Dio _dio;
  CryptoEndpoint(this._dio);

  Future<Response> getCryptoList() {
    return _dio.get(
      '/coins/markets?',
      queryParameters: {
        'vs_currency': 'BRL',
        'order': 'market_cap_desc',
        'per_page': '10',
        'page': '1',
        'sparkline': 'false',
      },
    );
  }
}
