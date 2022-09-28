import 'package:crypto_listing/shared/widgets/default_subtitle.dart';
import 'package:crypto_listing/shared/widgets/default_title.dart';
import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/providers/providers.dart';
import '../../shared/widgets/default_appbar.dart';
import '../../shared/widgets/number_formatter.dart';

class ConvertScreen extends StatefulHookConsumerWidget {
  const ConvertScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConvertScreen> createState() => _ConvertScreenState();
}

class _ConvertScreenState extends ConsumerState<ConvertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(
        title: "Converter",
        titleSize: 23,
        appBar: AppBar(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.grey.shade200,
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const DefaultSubtitle('Saldo disponível'),
                  DefaultSubtitle(
                    "${formatCriptoCompleto.format(DecimalIntl(Decimal.parse(ref.watch(criptoQtdWalletCriptoProvider).toString())))} ${ref.watch(criptoAbrevProvider).toUpperCase()}",
                    strong: 600,
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: DefaultTitle(
              title: "Quanto você gostaria de converter?",
              strong: 700,
              titleSize: 28,
            ),
          ),
        ],
      ),
    );
  }
}
