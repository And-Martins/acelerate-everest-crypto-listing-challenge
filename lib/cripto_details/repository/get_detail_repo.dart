import '../endpoint/get_detail_endpoint.dart';
import 'responses/detail_response.dart';

class GetDetailRepo {
  final GetDetailEndpoint _endpoint;

  GetDetailRepo(this._endpoint);

  Future<DetailResponse> getDetailList(String id) async {
    final result = await _endpoint.getCryptoDetailList(id);
    List<double> detailList = result.data!['prices']!
        .map<double>((item) => double.parse('${item[1]}'))
        .toList();
    Map<String, List<double>> json = {"prices": detailList};
    return DetailResponse.fromJson(json);
  }
}
