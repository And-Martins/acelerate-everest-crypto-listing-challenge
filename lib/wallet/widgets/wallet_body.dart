import 'package:crypto_listing/wallet/widgets/cripto_item.dart';
import 'package:crypto_listing/wallet/widgets/hide_button.dart';
import 'package:crypto_listing/wallet/widgets/total_value.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../l10n/app_localizations.dart';
import '../../shared/models/wallet_model.dart';
import '../../shared/providers/providers.dart';
import '../../shared/widgets/default_subtitle.dart';
import '../../shared/widgets/default_title.dart';
import '../controller/crypto_provider.dart';
import '../model/crypto_view_data.dart';

class WalletBody extends StatefulHookConsumerWidget {
  const WalletBody({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<WalletBody> createState() => _WalletBodyState();
}

class _WalletBodyState extends ConsumerState<WalletBody> {
  final scrollController = ScrollController();

  void onListen() {
    setState(() {});
  }

  @override
  void initState() {
    scrollController.addListener(onListen);

    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CryptoViewData cryptoData;
    return SafeArea(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: ref
              .watch(getTotalWalletValue(ref.watch(totalValueAmountProvider)))
              .when(
                data: (data) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DefaultTitle(
                          key: const Key('titleWalletScreen'),
                          title: TranslationFile.of(context)!.walletTitle,
                          color: const Color.fromRGBO(224, 43, 87, 1),
                        ),
                        const HideButton(),
                      ],
                    ),
                    TotalValue(
                      key: const Key('totalValueWalletScreen'),
                      totalReais: double.parse(
                        data.toString(),
                      ),
                    ),
                    DefaultSubtitle(
                        TranslationFile.of(context)!.walletSubtitle),
                  ],
                ),
                error: (error, stackTrace) => const Text("Deu erro"),
                loading: () => const Center(
                  child: CircularProgressIndicator(
                    key: Key('loadingHeaderWallet'),
                  ),
                ),
              ),
        ),
        Expanded(
          child: ref.watch(listCryptoProvider).when(
                data: (data) => ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  itemCount: data.cryptoViewDataList.length,
                  itemBuilder: (context, index) {
                    cryptoData = data.cryptoViewDataList[index];

                    final WalletModel walletModel = WalletModel(
                      quantityCoin: ref.watch(totalValueAmountProvider)[index],
                      valueWalletCoin:
                          data.cryptoViewDataList[index].currentPrice,
                      idCoin: cryptoData.symbol,
                    );

                    final itemPositionOffset = index * 90;
                    final difference =
                        scrollController.offset - itemPositionOffset;
                    final percent = 1 - (difference / 45);
                    double opacity = percent;
                    double scale = percent;
                    if (opacity > 1.0) opacity = 1.0;
                    if (opacity < 0.0) opacity = 0.0;

                    if (percent > 1.0) scale = 1.0;
                    {
                      return Opacity(
                        opacity: opacity,
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()..scale(scale, 1.0),
                          child: CriptoItem(
                            cryptoData: cryptoData,
                            walletModel: walletModel,
                          ),
                        ),
                      );
                    }
                  },
                ),
                error: (error, stackTrace) => const Text("Deu erro"),
                loading: () => const Center(
                  child: CircularProgressIndicator(
                    key: Key('loadingListViewWallet'),
                  ),
                ),
              ),
        ),
      ]),
    );
  }
}
