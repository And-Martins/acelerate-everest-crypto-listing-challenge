import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/providers/providers.dart';
import '../../shared/widgets/default_appbar.dart';
import '../widgets/detail_body.dart';

class DetailScreen extends StatefulHookConsumerWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final String criptoName = ref.watch(cryptoNameProvider);
    final String criptoAbrev = ref.watch(cryptoAbrevProvider);
    final String criptoImage = ref.watch(cryptoImageProvider);
    late Decimal criptoCotacao = ref.watch(cryptoCotacaoProvider);
    final double criptoVariacao = ref.watch(cryptoVariacaoProvider);
    final double criptoValueWalletReais =
        ref.watch(cryptoValueWalletReaisProvider);
    final double criptoQtdWallet = ref.watch(cryptoQtdWalletCriptoProvider);
    final int criptoDays = ref.watch(cryptoDaysProvider);
    final double criptoActualCurrency = ref.watch(cryptoActualCurrencyProvider);

    return Scaffold(
      appBar: const DefaultAppbar(
        title: "Detalhes",
        titleSize: 23,
      ),
      body: DetailBody(
          cryptoName: criptoName,
          cryptoImage: criptoImage,
          cryptoAbrev: criptoAbrev,
          cryptoCotacao: criptoCotacao,
          cryptoDays: criptoDays,
          cryptoActualCurrency: criptoActualCurrency,
          cryptoVariacao: criptoVariacao,
          cryptoValueWalletReais: criptoValueWalletReais,
          cryptoQtdWallet: criptoQtdWallet),
    );
  }
}
