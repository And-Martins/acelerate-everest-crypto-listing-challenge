import 'package:hooks_riverpod/hooks_riverpod.dart';

final hideWalletStateProvider = StateProvider((ref) => true);
final criptoNameProvider = StateProvider((ref) => '');
final criptoAbrevProvider = StateProvider((ref) => '');
final criptoImageProvider = StateProvider((ref) => '');
final criptoCotacaoProvider = StateProvider((ref) => 00.0);
final criptoVariacaoProvider = StateProvider((ref) => 00.0);
final criptoValueWalletReaisProvider = StateProvider((ref) => 00.0);
final criptoQtdWalletCriptoProvider = StateProvider((ref) => 00.0);
