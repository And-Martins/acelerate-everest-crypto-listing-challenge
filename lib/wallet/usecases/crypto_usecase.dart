import 'package:crypto_listing/wallet/model/crypto_list_view_data.dart';
import 'package:crypto_listing/wallet/usecases/i_crypto_usecase.dart';
import 'package:crypto_listing/wallet/utils/mapper/list_crypto_mapper.dart';

import '../repository/get_list/i_crypto_repo.dart';

class CryptoUsecase implements ICryptoUsecase {
  final ICryptoRepo _repo;

  CryptoUsecase(this._repo);

  @override
  Future<CryptoListViewData> execute() async {
    var response = await _repo.getCryptoList();
    return response.toViewData();
  }
}
