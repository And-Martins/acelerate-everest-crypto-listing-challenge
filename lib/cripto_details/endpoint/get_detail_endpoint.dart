import 'package:dio/dio.dart';

class GetDetailEndpoint {
  final Dio _dio;
  GetDetailEndpoint(this._dio);

  Future<Response> getCryptoDetailList(String id) {
    return _dio.get(
      '/coins/$id/market_chart',
      queryParameters: {
        'vs_currency': 'BRL',
        'days': '90',
        'interval': 'daily',
      },
    );
  }
}
