import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../l10n/translation_file.dart';
import '../../shared/providers/providers.dart';
import '../../shared/widgets/default_appbar.dart';
import '../widgets/detail_body.dart';

class DetailScreen extends StatefulHookConsumerWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final double criptoValueWalletReais =
        ref.watch(cryptoValueWalletReaisProvider);
    final double criptoQtdWallet = ref.watch(cryptoQtdWalletCriptoProvider);
    final int criptoDays = ref.watch(cryptoDaysProvider);

    return Scaffold(
      appBar: DefaultAppbar(
        key: const Key('AppbarDetailScreen'),
        title: TranslationFile.of(context)!.detailTitleAppBar,
        titleSize: 23,
      ),
      body: DetailBody(
        cryptoDays: criptoDays,
        cryptoValueWalletReais: criptoValueWalletReais,
        cryptoQtdWallet: criptoQtdWallet,
      ),
    );
  }
}
