import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../list_cripto_currency.dart';
import '../../shared/models/list_crypto_model.dart';
import '../../shared/models/wallet_model.dart';
import '../../shared/providers/wallet_providers.dart';
import '../../shared/widgets/number_formatter.dart';

class CriptoItem extends StatefulHookConsumerWidget {
  final CryptoModel cryptoModel;
  final WalletModel walletModel;

  const CriptoItem({
    Key? key,
    required this.cryptoModel,
    required this.walletModel,
  }) : super(key: key);

  @override
  ConsumerState<CriptoItem> createState() => _CriptoItemState();
}

class _CriptoItemState extends ConsumerState<CriptoItem> {
  @override
  Widget build(BuildContext context) {
    final bool hideWallet = ref.watch(hideWalletStateProvider);
    CryptoModel cryptoModel = widget.cryptoModel;
    WalletModel walletModel = widget.walletModel;
    List<FlSpot> criptoCurrentList = [];

    var criptoValueWalletReais = Decimal.parse(
        (cryptoModel.currentPrice * walletModel.quantityCoin).toString());

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
              cleanListCriptoCurrency();
              listCriptoCurrency();
              ref.watch(criptoActualCurrencyProvider.state).state =
                  double.parse(cryptoModel.currentPrice.toString());
              ref.watch(criptoNameProvider.state).state = cryptoModel.name;
              ref.watch(criptoAbrevProvider.state).state = cryptoModel.symbol;
              ref.watch(criptoImageProvider.state).state = cryptoModel.image;
              ref.watch(criptoCotacaoProvider.state).state =
                  actualCriptoCurrency().y;
              ref.watch(criptoVariacaoProvider.state).state =
                  cryptoModel.marketCapChangePercentage24h;
              ref.watch(criptoValueWalletReaisProvider.state).state = 2.0000;
              ref.watch(criptoQtdWalletCriptoProvider.state).state = 6557;
              Navigator.pushNamed(context, '/criptoDetails',
                  arguments: criptoCurrentList);
            },
            leading:
                CircleAvatar(backgroundImage: NetworkImage(cryptoModel.image)),
            title: Text(
              cryptoModel.symbol.toUpperCase(),
              style: GoogleFonts.sourceSansPro(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            subtitle: Text(
              cryptoModel.name,
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
                          "R\$ ${formatReais.format(DecimalIntl(criptoValueWalletReais))}",
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
                    "${formatCriptoAbrev.format(DecimalIntl(criptoValueQtdWallet))} ${cryptoModel.symbol.toUpperCase()}",
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
