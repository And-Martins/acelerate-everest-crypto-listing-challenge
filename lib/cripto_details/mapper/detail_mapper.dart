import 'package:crypto_listing/cripto_details/model/detail_view_data.dart';
import 'package:crypto_listing/cripto_details/model/responses/detail_response.dart';

extension DetailMapper on DetailResponse {
  DetailViewData toViewData() {
    return DetailViewData(
      prices: prices,
    );
  }
}
