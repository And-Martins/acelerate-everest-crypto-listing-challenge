import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final fromCryptoConvertAbrev = StateProvider((ref) => "");
final fromCryptoConvertImg = StateProvider((ref) => "");

final toCryptoConvertAbrev = StateProvider((ref) => "");
final convertedValue = StateProvider((ref) => Decimal.parse('0.00'));

final fromCryptoCotacaoProvider = StateProvider((ref) => 0.0);
final toCryptoCotacaoProvider = StateProvider((ref) => 0.0);

final transferCryptoConverted = StateProvider((ref) => 0.0);

final resultConvertedValue = StateProvider((ref) => 0.0);
