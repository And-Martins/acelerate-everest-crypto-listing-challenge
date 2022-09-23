import 'package:crypto_listing/wallet/endpoint/i_crypto_list_endpoint.dart';
import 'package:dio/dio.dart';

class CryptoEndpoint implements ICryptoListEndpoint {
  final Dio _dio;
  CryptoEndpoint(this._dio);

  @override
  Future<Response> getCryptoList() {
    return _dio.get(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=BRL&order=market_cap_desc&per_page=10&page=1&sparkline=false');
  }
}
