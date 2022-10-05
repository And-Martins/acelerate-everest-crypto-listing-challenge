import 'package:dio/dio.dart';

import '../shared/models/crypto_coin_model.dart';

class CryptocoinRepository {
  final Dio dio;
  CryptocoinRepository(this.dio);

  Future<CryptoCoinModel> getCrypto(String baseId) async {
    CryptoCoinModel crypto;

    final response = await dio
        .get('https://api.coinbase.com/v2/assets/prices/$baseId?base=BRL');
    crypto = response.data.map((crypto) {
      return CryptoCoinModel.fromMap(crypto);
    });
    return crypto;
  }
}
