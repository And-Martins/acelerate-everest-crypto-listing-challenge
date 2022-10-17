import '../repository/get_list/crypto_repo.dart';
import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/providers/providers.dart';
import '../endpoint/crypto_list_endpoint.dart';
import '../usecases/crypto_list/crypto_usecase.dart';
import '../usecases/wallet_amount/amount_usecase.dart';

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

final getTotalWalletAmountUseCaseProvider = StateProvider(
  (ref) => AmountUsecase(
    ref.watch(getCryptoRepoProvider),
  ),
);

final listCryptoProvider = FutureProvider(
  (ref) => ref.watch(getCryptoUseCaseProvider).execute(),
);

final getTotalWalletValue = FutureProvider.family<Decimal, List<double>>(
  (ref, args) => ref.watch(getTotalWalletAmountUseCaseProvider).execute(args),
);
