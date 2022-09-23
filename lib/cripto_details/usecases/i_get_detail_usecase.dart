import '../model/detail_view_data.dart';

abstract class IGetDetailUsecase {
  Future<DetailViewData> execute(String id);
}
