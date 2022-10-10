import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/providers/providers.dart';
import '../endpoint/get_detail_endpoint.dart';
import '../model/detail_list_view_data.dart';
import '../repository/get_detail_repo.dart';
import '../usecases/get_detail_usecase.dart';

final getDetailEndpointProvider = StateProvider(
  (ref) => GetDetailEndpoint(
    ref.watch(dioProvider),
  ),
);

final getDetailRepoProvider = StateProvider(
  (ref) => GetDetailRepo(
    ref.watch(getDetailEndpointProvider),
  ),
);

final getDetailUsecaseProvider = StateProvider(
  (ref) => GetDetailUsecase(
    ref.watch(getDetailRepoProvider),
  ),
);

final getDetailProvider = FutureProvider.family<DetailListViewData, String>(
  (ref, id) => ref.watch(getDetailUsecaseProvider).execute(id),
);
