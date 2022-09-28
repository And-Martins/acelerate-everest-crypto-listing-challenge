import '../model/detail_list_view_data.dart';
import '../repository/responses/detail_response.dart';

extension DetailMapper on DetailResponse {
  DetailListViewData toViewData() {
    List<List<double>> temp = [];
    for (int i = 0; i < prices.length; i++) {
      temp.add([
        prices[i],
      ]);
    }
    return DetailListViewData(
      prices: temp,
    );
  }
}
