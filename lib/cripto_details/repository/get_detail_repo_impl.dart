import 'package:crypto_listing/cripto_details/endpoint/i_get_detail_endpoint.dart';
import 'package:crypto_listing/cripto_details/model/responses/detail_response.dart';

import 'i_get_detail_repo.dart';

class GetDetailRepo implements IGetDetailRepo {
  final IGetDetailEndpoint _endpoint;
  GetDetailRepo(
    this._endpoint,
  );

  @override
  Future<DetailResponse> getDetailList(String id) async {
    final result = await _endpoint.getCryptoDetailList(id);
    return DetailResponse.fromJson(result.data);
  }
}
