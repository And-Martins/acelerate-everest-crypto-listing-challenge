import '../../l10n/translation_file.dart';
import '../../wallet/model/crypto_view_data.dart';
import 'cripto_icon.dart';
import 'title_value_cripto.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/providers/providers.dart';
import '../../shared/widgets/default_big_button.dart';
import '../../shared/widgets/default_subtitle.dart';
import '../../shared/widgets/default_title.dart';
import '../controller/providers.dart';
import 'button_day.dart';
import 'graphic.dart';
import 'item_detail.dart';

class DetailBody extends StatefulHookConsumerWidget {
  const DetailBody({
    Key? key,
    required this.cryptoDays,
    required this.cryptoValueWalletReais,
    required this.cryptoQtdWallet,
  }) : super(key: key);

  final int cryptoDays;
  final double cryptoValueWalletReais;
  final double cryptoQtdWallet;

  @override
  ConsumerState<DetailBody> createState() => _WalletBodyState();
}

class _WalletBodyState extends ConsumerState<DetailBody> {
  @override
  Widget build(BuildContext context) {
    final CryptoViewData cryptoViewData =
        ref.watch(cryptoDataProvider.state).state;
    double count = 90;
    return SingleChildScrollView(
      physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
      child: ref.watch(getDetailProvider(cryptoViewData.id)).when(
            data: (data) => Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DefaultTitle(
                        title: cryptoViewData.name,
                        key: const Key('defaultTitleDetailScreen'),
                      ),
                      CriptoIcon(criptoImage: cryptoViewData.image),
                    ],
                  ),
                  DefaultSubtitle(cryptoViewData.symbol.toUpperCase()),
                  TitleValorCripto(criptoCotacao: cryptoViewData.currentPrice),
                  Graphic(
                    defineSpot: List<FlSpot>.from(
                      data.prices.reversed.map(
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
                    criptoCotacao:
                        double.parse(cryptoViewData.currentPrice.toString()),
                    text: TranslationFile.of(context)!.item1Title,
                  ),
                  ItemDetail(
                    option: 2,
                    criptoVariacao: cryptoViewData.marketCapChangePercentage24h,
                    text: TranslationFile.of(context)!.item2Title,
                  ),
                  ItemDetail(
                    option: 3,
                    criptoAbrev: cryptoViewData.symbol,
                    criptoQtdWallet: widget.cryptoQtdWallet,
                    text: TranslationFile.of(context)!.item3Title,
                  ),
                  ItemDetail(
                    option: 4,
                    criptoValueWalletReais: widget.cryptoValueWalletReais,
                    text: TranslationFile.of(context)!.item4Title,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 15.0),
                    child: DefaultBigButton(
                      key: const Key('convertButtonDetailScreen'),
                      title: TranslationFile.of(context)!.convertButtonTitle,
                      route: "/convert",
                      cryptoQtdWallet: widget.cryptoQtdWallet,
                      cryptoAbrev: cryptoViewData.symbol,
                      cryptoCotacao: cryptoViewData.currentPrice,
                    ),
                  ),
                ],
              ),
            ),
            error: (error, stackTrace) =>
                const Text("Deu erro", key: Key('errorMessage')),
            loading: () => SizedBox(
              height: MediaQuery.of(context).size.height - 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Center(
                    child: CircularProgressIndicator(
                      key: Key('loadingDetailScreen'),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
