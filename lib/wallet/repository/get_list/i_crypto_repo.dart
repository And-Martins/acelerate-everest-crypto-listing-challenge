import '../responses/crypto_response.dart';

abstract class ICryptoRepo {
  Future<List<CryptoResponse>> getCryptoList();
}
