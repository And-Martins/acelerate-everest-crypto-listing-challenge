import 'package:dio/dio.dart';

import 'list_crypto_model.dart';

class ListCryptoRepository {
  final Dio dio;
  ListCryptoRepository(this.dio);

  Future<List<ListCryptoModel>> getList() async {
    List<ListCryptoModel> listCrypto = [];

    final response = await dio.get(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=BRL&order=market_cap_desc&per_page=10&page=1&sparkline=false');
    listCrypto = List.from(
      response.data.map((crypto) {
        return ListCryptoModel.fromMap(crypto);
      }),
    );
    return listCrypto;
  }
}
