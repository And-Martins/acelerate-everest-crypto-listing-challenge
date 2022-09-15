import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/providers/wallet_providers.dart';
import '../../shared/widgets/default_appbar.dart';
import '../../shared/widgets/default_big_button.dart';
import '../../shared/widgets/default_subtitle.dart';
import '../../shared/widgets/default_title.dart';
import '../widgets/button_day.dart';
import '../widgets/cripto_icon.dart';
import '../widgets/graphic.dart';
import '../widgets/item_detail.dart';
import '../widgets/title_value_cripto.dart';

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
    final double criptoCotacao = ref.watch(criptoCotacaoProvider);
    final double criptoVariacao = ref.watch(criptoVariacaoProvider);
    final double criptoValueWalletReais =
        ref.watch(criptoValueWalletReaisProvider);
    final double criptoQtdWallet = ref.watch(criptoQtdWalletCriptoProvider);

    return Scaffold(
      appBar: DefaultAppbar(
        title: "Detalhes",
        titleSize: 23,
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DefaultTitle(title: criptoName),
                  CriptoIcon(criptoImage: criptoImage),
                ],
              ),
              DefaultSubtitle(criptoAbrev),
              TitleValorCripto(criptoCotacao: criptoCotacao),
              const Graphic(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  ButtonDay(
                    text: "5D",
                  ),
                  ButtonDay(
                    text: "15D",
                  ),
                  ButtonDay(
                    text: "30D",
                  ),
                  ButtonDay(
                    text: "45D",
                  ),
                  ButtonDay(
                    text: "90D",
                  ),
                ],
              ),
              ItemDetail(
                opc: 1,
                criptoAbrev: criptoAbrev,
                criptoCotacao: criptoCotacao,
                criptoVariacao: criptoVariacao,
                criptoValueWalletReais: criptoValueWalletReais,
                criptoQtdWallet: criptoQtdWallet,
                text: "Preço atual",
              ),
              ItemDetail(
                opc: 2,
                criptoAbrev: criptoAbrev,
                criptoCotacao: criptoCotacao,
                criptoVariacao: criptoVariacao,
                criptoValueWalletReais: criptoValueWalletReais,
                criptoQtdWallet: criptoQtdWallet,
                text: "Variação 24H",
              ),
              ItemDetail(
                opc: 3,
                criptoAbrev: criptoAbrev,
                criptoCotacao: criptoCotacao,
                criptoVariacao: criptoVariacao,
                criptoValueWalletReais: criptoValueWalletReais,
                criptoQtdWallet: criptoQtdWallet,
                text: "Quantidade",
              ),
              ItemDetail(
                opc: 4,
                criptoAbrev: criptoAbrev,
                criptoCotacao: criptoCotacao,
                criptoVariacao: criptoVariacao,
                criptoValueWalletReais: criptoValueWalletReais,
                criptoQtdWallet: criptoQtdWallet,
                text: "Valor",
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
                child: DefaultBigButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
