import 'package:crypto_listing/cripto_details/mapper/detail_mapper.dart';
import 'package:crypto_listing/cripto_details/model/detail_view_data.dart';
import 'package:crypto_listing/cripto_details/model/responses/detail_response.dart';
import 'package:crypto_listing/cripto_details/repository/i_get_detail_repo.dart';
import 'package:crypto_listing/cripto_details/usecases/i_get_detail_usecase.dart';

class GetDetailUsecase implements IGetDetailUsecase {
  final IGetDetailRepo _repo;

  GetDetailUsecase(
    this._repo,
  );

  @override
  Future<DetailViewData> execute(String id) async {
    DetailResponse response = await _repo.getDetailList(id);
    return response.toViewData();
  }
}
