import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/models/wallet_model.dart';
import '../../shared/providers/wallet_providers.dart';
import '../../shared/widgets/default_subtitle.dart';
import '../../shared/widgets/default_title.dart';
import '../controller/crypto_provider.dart';
import '../model/crypto_list_view_data.dart';
import '../model/crypto_view_data.dart';
import 'cripto_item.dart';
import 'hide_button.dart';
import 'total_value.dart';

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
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
            child: FutureBuilder(
              future: ref.watch(
                  getTotalWalletValue(ref.watch(totalValueAmountProvider))
                      .future),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          DefaultTitle(
                            title: 'Cripto',
                            color: Color.fromRGBO(224, 43, 87, 1),
                          ),
                          HideButton(),
                        ],
                      ),
                      TotalValue(
                          totalReais: double.parse(snapshot.data!.toString())),
                      const DefaultSubtitle('Valor total de moedas'),
                    ],
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: ref.watch(listCryptoProvider.future),
              builder: (context, AsyncSnapshot<CryptoListViewData> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: scrollController,
                    itemCount: snapshot.data!.cryptoViewDataList.length,
                    itemBuilder: (context, index) {
                      CryptoViewData cryptoData =
                          snapshot.data!.cryptoViewDataList[index];

                      final WalletModel walletModel = WalletModel(
                        quantityCoin:
                            ref.watch(totalValueAmountProvider)[index],
                        valueWalletCoin: snapshot
                            .data!.cryptoViewDataList[index].currentPrice,
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
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
