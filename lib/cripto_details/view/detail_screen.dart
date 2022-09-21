import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../list_cripto_currency.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              DefaultSubtitle(criptoAbrev.toUpperCase()),
              TitleValorCripto(criptoCotacao: criptoCotacao),
              Graphic(
                defineSpot: listCriptoCurrency(),
                days: criptoDays,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  ButtonDay(
                    text: "5D",
                    days: 5,
                  ),
                  ButtonDay(
                    text: "15D",
                    days: 15,
                  ),
                  ButtonDay(
                    text: "30D",
                    days: 30,
                  ),
                  ButtonDay(
                    text: "45D",
                    days: 45,
                  ),
                  ButtonDay(
                    text: "90D",
                    days: 90,
                  ),
                ],
              ),
              ItemDetail(
                opc: 1,
                criptoAbrev: criptoAbrev,
                criptoCotacao: criptoActualCurrency,
                criptoVariacao: criptoVariacao,
                criptoValueWalletReais: criptoValueWalletReais,
                criptoQtdWallet: criptoQtdWallet,
                text: "Preço atual",
              ),
              ItemDetail(
                opc: 2,
                criptoAbrev: criptoAbrev,
                criptoCotacao: criptoActualCurrency,
                criptoVariacao: criptoVariacao,
                criptoValueWalletReais: criptoValueWalletReais,
                criptoQtdWallet: criptoQtdWallet,
                text: "Variação 24H",
              ),
              ItemDetail(
                opc: 3,
                criptoAbrev: criptoAbrev,
                criptoCotacao: criptoActualCurrency,
                criptoVariacao: criptoVariacao,
                criptoValueWalletReais: criptoValueWalletReais,
                criptoQtdWallet: criptoQtdWallet,
                text: "Quantidade",
              ),
              ItemDetail(
                opc: 4,
                criptoAbrev: criptoAbrev,
                criptoCotacao: criptoActualCurrency,
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
