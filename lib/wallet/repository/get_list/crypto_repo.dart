import '../../endpoint/crypto_list_endpoint.dart';
import '../responses/crypto_response.dart';

class CryptoRepo {
  final CryptoEndpoint _endpoint;

  CryptoRepo(this._endpoint);

  Future<List<CryptoResponse>> getCryptoList() async {
    final result = await _endpoint.getCryptoList();
    return List<CryptoResponse>.from(
      result.data.map(
        (item) => CryptoResponse.fromMap(item),
      ),
    );
  }
}
