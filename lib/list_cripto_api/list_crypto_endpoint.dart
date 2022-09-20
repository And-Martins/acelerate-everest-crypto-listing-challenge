// import 'package:crypto_listing/shared/providers/wallet_providers.dart';
// import 'package:dio/dio.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class ListCryptoEndpoint {
//   final Dio _dio;

//   ListCryptoEndpoint(this._dio);

//   Future<Response> getCryptoList() {
//     return _dio.get(
//         'https://api.coingecko.com/api/v3/coins/markets?vs_currency=brl&order=market_cap_desc&per_page=10&page=1&sparkline=false');
//   }
// }

// final listCryptoEndpointProvider = Provider((ref) {
//   final dio = ref.read(dioProvider).build();
//   return ListCryptoEndpoint(dio);
// });
