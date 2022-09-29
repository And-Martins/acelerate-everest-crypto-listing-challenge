import '../mapper/detail_mapper.dart';

import '../model/detail_list_view_data.dart';
import '../repository/get_detail_repo.dart';
import '../repository/responses/detail_response.dart';

class GetDetailUsecase {
  final GetDetailRepo _repo;

  GetDetailUsecase(this._repo);

  Future<DetailListViewData> execute(String id) async {
    DetailResponse response = await _repo.getDetailList(id);
    return response.toViewData();
  }
}
