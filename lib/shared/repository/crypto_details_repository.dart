import 'package:crypto_listing/shared/models/crypto_details_model.dart';
import 'package:dio/dio.dart';

class CryptoDetailsRepository {
  final Dio dio;
  CryptoDetailsRepository(this.dio);

  Future<List<CryptoDetailModel>> getList() async {
    List<CryptoDetailModel> listDetailCrypto = [];

    final response = await dio.get(
        'https://api.coingecko.com/api/v3/coins/bitcoin/market_chart?vs_currency=brl&days=3&interval=daily');
    listDetailCrypto = List.from(
      response.data.map((cryptoDetail) {
        return CryptoDetailModel.fromMap(cryptoDetail);
      }),
    );
    return listDetailCrypto;
  }
}
