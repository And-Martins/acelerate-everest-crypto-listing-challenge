import 'package:crypto_listing/cripto_details/widgets/cripto_icon.dart';
import 'package:crypto_listing/cripto_details/widgets/title_value_cripto.dart';
import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/providers/providers.dart';
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
    required this.cryptoName,
    required this.cryptoImage,
    required this.cryptoAbrev,
    required this.cryptoCotacao,
    required this.cryptoDays,
    required this.cryptoActualCurrency,
    required this.cryptoVariacao,
    required this.cryptoValueWalletReais,
    required this.cryptoQtdWallet,
  }) : super(key: key);

  final String cryptoName;
  final String cryptoImage;
  final String cryptoAbrev;
  final Decimal cryptoCotacao;
  final int cryptoDays;
  final double cryptoActualCurrency;
  final double cryptoVariacao;
  final double cryptoValueWalletReais;
  final double cryptoQtdWallet;

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
                      DefaultTitle(title: widget.cryptoName),
                      CriptoIcon(criptoImage: widget.cryptoImage),
                    ],
                  ),
                  DefaultSubtitle(widget.cryptoAbrev.toUpperCase()),
                  TitleValorCripto(criptoCotacao: widget.cryptoCotacao),
                  Graphic(
                    defineSpot: List<FlSpot>.from(
                      snapshot.data!.prices.reversed.map(
                        (item) => FlSpot(
                          count--,
                          item[0].toDouble(),
                        ),
                      ),
                    ),
                    days: widget.cryptoDays,
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
                    option: 1,
                    criptoAbrev: widget.cryptoAbrev,
                    criptoCotacao: widget.cryptoActualCurrency,
                    criptoVariacao: widget.cryptoVariacao,
                    criptoValueWalletReais: widget.cryptoValueWalletReais,
                    criptoQtdWallet: widget.cryptoQtdWallet,
                    text: "Preço atual",
                  ),
                  ItemDetail(
                    option: 2,
                    criptoAbrev: widget.cryptoAbrev,
                    criptoCotacao: widget.cryptoActualCurrency,
                    criptoVariacao: widget.cryptoVariacao,
                    criptoValueWalletReais: widget.cryptoValueWalletReais,
                    criptoQtdWallet: widget.cryptoQtdWallet,
                    text: "Variação 24H",
                  ),
                  ItemDetail(
                    option: 3,
                    criptoAbrev: widget.cryptoAbrev,
                    criptoCotacao: widget.cryptoActualCurrency,
                    criptoVariacao: widget.cryptoVariacao,
                    criptoValueWalletReais: widget.cryptoValueWalletReais,
                    criptoQtdWallet: widget.cryptoQtdWallet,
                    text: "Quantidade",
                  ),
                  ItemDetail(
                    option: 4,
                    criptoAbrev: widget.cryptoAbrev,
                    criptoCotacao: widget.cryptoActualCurrency,
                    criptoVariacao: widget.cryptoVariacao,
                    criptoValueWalletReais: widget.cryptoValueWalletReais,
                    criptoQtdWallet: widget.cryptoQtdWallet,
                    text: "Valor",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 15.0),
                    child: DefaultBigButton(
                      cryptoQtdWallet: widget.cryptoQtdWallet,
                      cryptoAbrev: widget.cryptoAbrev,
                      cryptoCotacao: widget.cryptoCotacao,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox(
              height: MediaQuery.of(context).size.height - 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
