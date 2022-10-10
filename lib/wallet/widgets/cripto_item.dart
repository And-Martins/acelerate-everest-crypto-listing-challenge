import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../convert/controller/providers.dart';
import '../../shared/models/wallet_model.dart';
import '../../shared/providers/providers.dart';
import '../../shared/widgets/number_formatter.dart';
import '../model/crypto_view_data.dart';

class CriptoItem extends StatefulHookConsumerWidget {
  final CryptoViewData cryptoData;
  final WalletModel walletModel;

  const CriptoItem({
    Key? key,
    required this.cryptoData,
    required this.walletModel,
  }) : super(key: key);

  @override
  ConsumerState<CriptoItem> createState() => _CriptoItemState();
}

class _CriptoItemState extends ConsumerState<CriptoItem> {
  @override
  Widget build(BuildContext context) {
    final bool hideWallet = ref.watch(hideWalletStateProvider);
    CryptoViewData cryptoData = widget.cryptoData;
    WalletModel walletModel = widget.walletModel;

    var criptoValueWalletReais =
        (double.parse(cryptoData.currentPrice.toString()) *
            walletModel.quantityCoin);

    var criptoValueQtdWallet =
        Decimal.parse(walletModel.quantityCoin.toString());

    return SizedBox(
      height: 90,
      child: Column(
        children: [
          const Divider(
            thickness: 1,
          ),
          ListTile(
            onTap: () {
              ref.watch(fieldTransferValue.state).state = "";
              ref.watch(transferCryptoConverted.state).state = 0.0;
              ref.watch(toCryptoCotacaoProvider.state).state = 0.0;
              ref.watch(resultConvertedValue.state).state = 0.0;
              ref.watch(cryptoActualCurrencyProvider.state).state =
                  double.parse(cryptoData.currentPrice.toString());
              ref.watch(cryptoNameProvider.state).state = cryptoData.name;
              ref.watch(cryptoIdProvider.state).state = cryptoData.id;
              ref.watch(cryptoAbrevProvider.state).state = cryptoData.symbol;
              ref.watch(cryptoImageProvider.state).state = cryptoData.image;
              ref.watch(cryptoCotacaoProvider.state).state =
                  cryptoData.currentPrice;
              ref.watch(cryptoVariacaoProvider.state).state =
                  cryptoData.marketCapChangePercentage24h;
              ref.watch(cryptoValueWalletReaisProvider.state).state =
                  criptoValueWalletReais;
              ref.watch(cryptoQtdWalletCriptoProvider.state).state =
                  walletModel.quantityCoin;
              Navigator.pushNamed(
                context,
                '/criptoDetails',
              );
            },
            leading:
                CircleAvatar(backgroundImage: NetworkImage(cryptoData.image)),
            title: Text(
              cryptoData.symbol.toUpperCase(),
              style: GoogleFonts.sourceSansPro(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            subtitle: Text(
              cryptoData.name,
              style: GoogleFonts.sourceSansPro(
                fontSize: 15,
                color: const Color.fromRGBO(117, 118, 128, 1),
              ),
            ),
            trailing: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Visibility(
                        visible: hideWallet,
                        replacement: Text(
                          "R\$ ${formatReais.format(criptoValueWalletReais)}",
                          style: GoogleFonts.sourceSansPro(
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        child: Container(
                          color: Colors.grey,
                          width: MediaQuery.of(context).size.width - 320.5,
                          height: 13,
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right_outlined,
                        size: 30,
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: hideWallet,
                  replacement: Text(
                    "${formatCriptoAbrev.format(DecimalIntl(criptoValueQtdWallet))} ${cryptoData.symbol.toUpperCase()}",
                    style: GoogleFonts.sourceSansPro(
                      fontSize: 15,
                      color: const Color.fromRGBO(117, 118, 128, 1),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  child: Container(
                    color: Colors.grey,
                    width: MediaQuery.of(context).size.width - 355.5,
                    height: 18.8,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
