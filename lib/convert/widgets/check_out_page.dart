import 'package:crypto_listing/shared/widgets/default_appbar.dart';
import 'package:crypto_listing/shared/widgets/default_big_button.dart';
import 'package:crypto_listing/shared/widgets/default_title.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../cripto_details/widgets/item_detail.dart';
import '../../shared/providers/providers.dart';
import '../controller/providers.dart';

class CheckOutPage extends ConsumerWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: DefaultAppbar(
        appBar: AppBar(),
        title: 'Revisar',
        titleSize: 22,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: DefaultTitle(
                title: 'Revise os dados da sua conversão',
                strong: 700,
              ),
            ),
            const SizedBox(height: 190),
            ItemDetail(
              option: 3,
              criptoAbrev:
                  ref.watch(fromCryptoConvertAbrev.state).state.toUpperCase(),
              criptoQtdWallet:
                  double.parse(ref.watch(fieldTransferValue.state).state),
              text: "Converter",
            ),
            ItemDetail(
              option: 3,
              criptoAbrev:
                  ref.watch(toCryptoConvertAbrev.state).state.toUpperCase(),
              criptoQtdWallet: ref.watch(resultConvertedValue.state).state,
              text: "Receber",
            ),
            ItemDetail(
              option: 5,
              criptoAbrev:
                  ref.watch(fromCryptoConvertAbrev.state).state.toUpperCase(),
              criptoAbrevTo:
                  ref.watch(toCryptoConvertAbrev.state).state.toUpperCase(),
              criptoQtdWallet: ref.watch(resultConvertedValue.state).state,
              text: "Receber",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: DefaultBigButton(
                title: "Concluir conversão",
              ),
            )
          ],
        ),
      ),
    );
  }
}
