import 'package:crypto_listing/wallet/model/crypto_list/crypto_list_view_data.dart';
import 'package:crypto_listing/wallet/utils/mapper/list_crypto_mapper.dart';
import 'package:decimal/decimal.dart';

import '../../repository/get_list/i_crypto_repo.dart';
import 'i_amount_usecase.dart';

class AmountUsecase implements IAmountUsecase {
  final ICryptoRepo _repo;

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
