import '../../mapper/list_crypto_mapper.dart';

import '../../model/crypto_list_view_data.dart';
import '../../repository/get_list/crypto_repo.dart';

class CryptoUsecase {
  final CryptoRepo _repo;

  CryptoUsecase(this._repo);

  Future<CryptoListViewData> execute() async {
    var response = await _repo.getCryptoList();
    return response.toViewData();
  }
}
