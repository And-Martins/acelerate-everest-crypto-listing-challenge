import '../model/crypto_list_view_data.dart';

abstract class ICryptoUsecase {
  Future<CryptoListViewData> execute();
}