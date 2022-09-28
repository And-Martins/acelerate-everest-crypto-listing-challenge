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
    final String criptoName = ref.watch(criptoNameProvider);
    final String criptoAbrev = ref.watch(criptoAbrevProvider);
    final String criptoImage = ref.watch(criptoImageProvider);
    late Decimal criptoCotacao = ref.watch(criptoCotacaoProvider);
    final double criptoVariacao = ref.watch(criptoVariacaoProvider);
    final double criptoValueWalletReais =
        ref.watch(criptoValueWalletReaisProvider);
    final double criptoQtdWallet = ref.watch(criptoQtdWalletCriptoProvider);
    final int criptoDays = ref.watch(criptoDaysProvider);
    final double criptoActualCurrency = ref.watch(criptoActualCurrencyProvider);

    return Scaffold(
      appBar: DefaultAppbar(
        title: "Detalhes",
        titleSize: 23,
        appBar: AppBar(),
      ),
      body: DetailBody(
          criptoName: criptoName,
          criptoImage: criptoImage,
          criptoAbrev: criptoAbrev,
          criptoCotacao: criptoCotacao,
          criptoDays: criptoDays,
          criptoActualCurrency: criptoActualCurrency,
          criptoVariacao: criptoVariacao,
          criptoValueWalletReais: criptoValueWalletReais,
          criptoQtdWallet: criptoQtdWallet),
    );
  }
}