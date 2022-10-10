import 'package:dio/dio.dart';

import '../shared/models/crypto_list_model.dart';

class CryptoListRepository {
  final Dio dio;
  CryptoListRepository(this.dio);

  Future<List<CryptoListModel>> getList() async {
    List<CryptoListModel> cryptos = [];

    final response =
        await dio.get('http://api.coinbase.com/v2/assets/prices?base=BRL');
    cryptos = List.from(
      response.data.map((cryptos) {
        return CryptoListModel.fromMap(cryptos);
      }),
    );
    return cryptos;
  }
}
