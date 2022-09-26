import 'package:crypto_listing/cripto_details/controller/providers.dart';
import 'package:crypto_listing/cripto_details/widgets/button_day.dart';
import 'package:crypto_listing/cripto_details/widgets/cripto_icon.dart';
import 'package:crypto_listing/cripto_details/widgets/graphic.dart';
import 'package:crypto_listing/cripto_details/widgets/item_detail.dart';
import 'package:crypto_listing/cripto_details/widgets/title_value_cripto.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../list_cripto_currency.dart';
import '../../shared/providers/wallet_providers.dart';
import '../../shared/widgets/default_big_button.dart';
import '../../shared/widgets/default_subtitle.dart';
import '../../shared/widgets/default_title.dart';

class DetailsBody extends HookConsumerWidget {
  const DetailsBody({
    Key? key,
    required this.criptoName,
    required this.criptoImage,
    required this.criptoAbrev,
    required this.criptoCotacao,
    required this.criptoDays,
    required this.criptoActualCurrency,
    required this.criptoVariacao,
    required this.criptoValueWalletReais,
    required this.criptoQtdWallet,
  }) : super(key: key);

  final String criptoName;
  final String criptoImage;
  final String criptoAbrev;
  final double criptoCotacao;
  final double criptoDays;
  final double criptoActualCurrency;
  final double criptoVariacao;
  final double criptoValueWalletReais;
  final double criptoQtdWallet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref.watch(
        getDetailProvider(ref.watch(cryptoIdProvider)).future,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
                    child: DefaultBigButton(),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
