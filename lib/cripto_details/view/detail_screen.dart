import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/providers/wallet_providers.dart';
import '../../shared/widgets/default_appbar.dart';
import '../model/responses/detail_response.dart';
import '../widgets/details_body.dart';

class DetailScreen extends StatefulHookConsumerWidget {
  const DetailScreen({super.key});

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Future<DetailResponse> detailResponse;
    final String criptoName = ref.watch(criptoNameProvider);
    final String criptoAbrev = ref.watch(criptoAbrevProvider);
    final String criptoImage = ref.watch(criptoImageProvider);
    late double criptoCotacao = ref.watch(criptoCotacaoProvider);
    final double criptoVariacao = ref.watch(criptoVariacaoProvider);
    final double criptoValueWalletReais =
        ref.watch(criptoValueWalletReaisProvider);
    final double criptoQtdWallet = ref.watch(criptoQtdWalletCriptoProvider);
    final double criptoDays = ref.watch(criptoDaysProvider);
    final double criptoActualCurrency = ref.watch(criptoActualCurrencyProvider);

    return Scaffold(
      appBar: DefaultAppbar(
        title: "Detalhes",
        titleSize: 23,
        appBar: AppBar(),
      ),
      body: DetailsBody(
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
