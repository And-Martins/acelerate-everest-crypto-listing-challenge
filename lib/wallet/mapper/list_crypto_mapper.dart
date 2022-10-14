import '../model/crypto_list_view_data.dart';
import '../model/crypto_view_data.dart';
import '../repository/responses/crypto_response.dart';

extension ListCryptoMapper on List<CryptoResponse> {
  CryptoListViewData toViewData() {
    return CryptoListViewData(
      cryptoViewDataList: map(
        (item) => CryptoViewData(
          id: item.id,
          symbol: item.symbol,
          name: item.name,
          image: item.image,
          currentPrice: item.currentPrice,
          marketCapChangePercentage24h: item.marketCapChangePercentage24h,
        ),
      ).toList(),
    );
  }
}
