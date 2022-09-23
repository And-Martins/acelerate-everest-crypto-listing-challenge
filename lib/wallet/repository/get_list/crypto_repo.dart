import 'package:crypto_listing/wallet/endpoint/i_crypto_list_endpoint.dart';
import 'package:crypto_listing/wallet/repository/get_list/i_crypto_repo.dart';

import '../responses/crypto_response.dart';

class CryptoRepo implements ICryptoRepo {
  final ICryptoListEndpoint _endpoint;

  CryptoRepo(this._endpoint);

  @override
  Future<List<CryptoResponse>> getCryptoList() async {
    final result = await _endpoint.getCryptoList();
    return List<CryptoResponse>.from(
      result.data.map(
        (item) => CryptoResponse.fromMap(item),
      ),
    );
  }
}
