import 'package:crypto_listing/wallet/model/crypto_view_data.dart';

class ApiFactory {
  static Set<List<CryptoViewData>> getCryptoList() => {
        [
          CryptoViewData(
              id: 'bitcoin',
              symbol: 'btc',
              name: 'Bitcoin',
              image:
                  'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579',
              currentPrice: 100837,
              marketCapChangePercentage24h: -0.63286),
          CryptoViewData(
              id: 'ethereum',
              symbol: 'etc',
              name: 'Ethereum',
              image:
                  'https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880',
              currentPrice: 6825.79,
              marketCapChangePercentage24h: -0.39265),
          CryptoViewData(
              id: 'tether',
              symbol: 'usdt',
              name: 'Tether',
              image:
                  'https://assets.coingecko.com/coins/images/325/large/Tether-logo.png?1598003707',
              currentPrice: 5.22,
              marketCapChangePercentage24h: -1.00496),
        ]
      };
}
