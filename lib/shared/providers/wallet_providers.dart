import 'package:hooks_riverpod/hooks_riverpod.dart';

final hideWalletStateProvider = StateProvider((ref) => false);
final criptoNameProvider = StateProvider((ref) => '');
final criptoAbrevProvider = StateProvider((ref) => '');
final criptoImageProvider = StateProvider((ref) => '');
final criptoCotacaoProvider = StateProvider((ref) => 00.0);
final criptoVariacaoProvider = StateProvider((ref) => 00.0);
final criptoValueWalletReaisProvider = StateProvider((ref) => 00.0);
final criptoQtdWalletCriptoProvider = StateProvider((ref) => 00.0);
final criptoDaysProvider = StateProvider((ref) => 5.0);
final criptoActualCurrencyProvider = StateProvider((ref) => 0.0);
final cryptoIdProvider = StateProvider((ref) => '');
