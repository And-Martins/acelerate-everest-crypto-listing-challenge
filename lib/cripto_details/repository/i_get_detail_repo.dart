import '../model/responses/detail_response.dart';

abstract class IGetDetailRepo {
  Future<DetailResponse> getDetailList(String id);
}
