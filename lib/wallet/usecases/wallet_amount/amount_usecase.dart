import 'package:crypto_listing/wallet/mapper/list_crypto_mapper.dart';
import 'package:decimal/decimal.dart';

import '../../model/crypto_list_view_data.dart';
import '../../repository/get_list/crypto_repo.dart';

class AmountUsecase {
  final CryptoRepo _repo;

  AmountUsecase(
    this._repo,
  );

  @override
  Future<Decimal> execute(List<double> userAmountsCripto) async {
    var response = await _repo.getCryptoList();
    Decimal walletTotalValue = Decimal.parse('0');
    CryptoListViewData criptoValues = response.toViewData();
    for (var i = 0; i < userAmountsCripto.length; i++) {
      walletTotalValue += Decimal.parse(userAmountsCripto[i].toString()) *
          criptoValues.cryptoViewDataList[i].currentPrice;
    }
    return walletTotalValue;
  }
}
