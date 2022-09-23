import 'package:crypto_listing/cripto_details/endpoint/i_get_detail_endpoint.dart';
import 'package:dio/dio.dart';

class GetDetailEndpoint implements IGetDetailEndpoint {
  final Dio _dio;
  GetDetailEndpoint(this._dio);

  @override
  Future<Response> getCryptoDetailList(String id) {
    return _dio.get(
        'https://api.coingecko.com/api/v3/coins/$id/market_chart?vs_currency=brl&days=90&interval=daily');
  }
}
