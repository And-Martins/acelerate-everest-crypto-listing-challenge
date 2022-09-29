import 'package:crypto_listing/cripto_details/widgets/cripto_icon.dart';
import 'package:crypto_listing/cripto_details/widgets/title_value_cripto.dart';
import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/providers/wallet_providers.dart';
import '../../shared/widgets/default_big_button.dart';
import '../../shared/widgets/default_subtitle.dart';
import '../../shared/widgets/default_title.dart';
import '../controller/providers.dart';
import '../model/detail_list_view_data.dart';
import 'button_day.dart';
import 'graphic.dart';
import 'item_detail.dart';

class DetailBody extends StatefulHookConsumerWidget {
  const DetailBody({
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
  final Decimal criptoCotacao;
  final int criptoDays;
  final double criptoActualCurrency;
  final double criptoVariacao;
  final double criptoValueWalletReais;
  final double criptoQtdWallet;

  @override
  ConsumerState<DetailBody> createState() => _WalletBodyState();
}

class _WalletBodyState extends ConsumerState<DetailBody> {
  @override
  Widget build(BuildContext context) {
    double count = 90;
    return SingleChildScrollView(
      physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
      child: FutureBuilder(
        future: ref.watch(
          getDetailProvider(ref.watch(cryptoIdProvider)).future,
        ),
        builder: (context, AsyncSnapshot<DetailListViewData> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DefaultTitle(title: widget.criptoName),
                      CriptoIcon(criptoImage: widget.criptoImage),
                    ],
                  ),
                  DefaultSubtitle(widget.criptoAbrev.toUpperCase()),
                  TitleValorCripto(criptoCotacao: widget.criptoCotacao),
                  Graphic(
                    defineSpot: List<FlSpot>.from(
                      snapshot.data!.prices.reversed.map(
                        (item) => FlSpot(
                          count--,
                          item[0].toDouble(),
                        ),
                      ),
                    ),
                    days: widget.criptoDays,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                    criptoAbrev: widget.criptoAbrev,
                    criptoCotacao: widget.criptoActualCurrency,
                    criptoVariacao: widget.criptoVariacao,
                    criptoValueWalletReais: widget.criptoValueWalletReais,
                    criptoQtdWallet: widget.criptoQtdWallet,
                    text: "Preço atual",
                  ),
                  ItemDetail(
                    opc: 2,
                    criptoAbrev: widget.criptoAbrev,
                    criptoCotacao: widget.criptoActualCurrency,
                    criptoVariacao: widget.criptoVariacao,
                    criptoValueWalletReais: widget.criptoValueWalletReais,
                    criptoQtdWallet: widget.criptoQtdWallet,
                    text: "Variação 24H",
                  ),
                  ItemDetail(
                    opc: 3,
                    criptoAbrev: widget.criptoAbrev,
                    criptoCotacao: widget.criptoActualCurrency,
                    criptoVariacao: widget.criptoVariacao,
                    criptoValueWalletReais: widget.criptoValueWalletReais,
                    criptoQtdWallet: widget.criptoQtdWallet,
                    text: "Quantidade",
                  ),
                  ItemDetail(
                    opc: 4,
                    criptoAbrev: widget.criptoAbrev,
                    criptoCotacao: widget.criptoActualCurrency,
                    criptoVariacao: widget.criptoVariacao,
                    criptoValueWalletReais: widget.criptoValueWalletReais,
                    criptoQtdWallet: widget.criptoQtdWallet,
                    text: "Valor",
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
                    child: DefaultBigButton(),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
