import 'package:crypto_listing/cripto_details/repository/responses/detail_response.dart';

import '../endpoint/get_detail_endpoint.dart';

class GetDetailRepo {
  final GetDetailEndpoint _endpoint;

  GetDetailRepo(this._endpoint);

  @override
  Future<DetailResponse> getDetailList(String id) async {
    final result = await _endpoint.getCryptoDetailList(id);
    List<double> detailList = result.data!['prices']!
        .map<double>((item) => double.parse('${item[1]}'))
        .toList();
    Map<String, List<double>> json = {"prices": detailList};
    return DetailResponse.fromJson(json);
  }
}
