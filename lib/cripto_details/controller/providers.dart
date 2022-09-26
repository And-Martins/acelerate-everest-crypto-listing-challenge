import 'package:crypto_listing/cripto_details/repository/get_detail_repo_impl.dart';
import 'package:crypto_listing/cripto_details/usecases/get_detail_usecase.dart';
import 'package:crypto_listing/shared/utils/providers/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../endpoint/get_detail_endpoint.dart';
import '../model/detail_view_data.dart';

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

final getDetailProvider = FutureProvider.family<DetailViewData, String>(
  (ref, id) => ref.watch(getDetailUsecaseProvider).execute(id),
);
