import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../convert/controller/providers.dart';
import '../../cripto_details/widgets/item_detail.dart';
import '../../shared/providers/providers.dart';
import '../../shared/widgets/default_title.dart';

class ReviewBody extends HookConsumerWidget {
  const ReviewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
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
            const SizedBox(height: 195),
            ItemDetail(
              option: 3,
              criptoAbrev:
                  ref.watch(fromCryptoConvertAbrev.state).state.toUpperCase(),
              criptoQtdWallet: double.parse(ref.watch(fieldTransferValue)),
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
              criptoQtdWallet: ref.watch(toCryptoCotacaoProvider.state).state,
              text: "Receber",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/complete-conversion',
                    );
                  },
                  child: const Text(
                    'Concluir conversão',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
