import '../../mapper/list_crypto_mapper.dart';

import '../../model/crypto_list_view_data.dart';
import '../../repository/get_list/crypto_repo.dart';

class AmountUsecase {
  final CryptoRepo _repo;

  AmountUsecase(
    this._repo,
  );

  Future<double> execute(List<double> userAmountsCripto) async {
    var response = await _repo.getCryptoList();
    double walletTotalValue = 0.0;
    CryptoListViewData criptoValues = response.toViewData();
    for (var i = 0; i < userAmountsCripto.length; i++) {
      walletTotalValue += userAmountsCripto[i] *
          criptoValues.cryptoViewDataList[i].currentPrice;
    }
    return walletTotalValue;
  }
}
