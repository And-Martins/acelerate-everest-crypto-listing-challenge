import 'package:crypto_listing/shared/utils/providers/provider.dart';
import 'package:crypto_listing/wallet/repository/get_list/crypto_repo.dart';
import 'package:crypto_listing/wallet/usecases/crypto_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../endpoint/cryptos_list_endpoint.dart';

final getCryptoEndPointProvider = StateProvider(
  (ref) => CryptoEndpoint(
    ref.watch(dioProvider),
  ),
);

final getCryptoRepoProvider = StateProvider(
  (ref) => CryptoRepo(
    ref.watch(getCryptoEndPointProvider),
  ),
);

final getCryptoUseCaseProvider = StateProvider(
  (ref) => CryptoUsecase(
    ref.watch(getCryptoRepoProvider),
  ),
);

final listCryptoProvider = FutureProvider(
  (ref) => ref.watch(getCryptoUseCaseProvider).execute(),
);
