import 'package:crypto_listing/transactions/model/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../core/asset.dart';
import '../../l10n/app_localizations.dart';
import '../../shared/widgets/default_navbar.dart';
import '../../shared/widgets/default_subtitle.dart';
import '../../shared/widgets/default_title.dart';
import '../../shared/widgets/number_formatter.dart';
import '../providers/transaction_providers.dart';

class TransactionsScreen extends StatefulHookConsumerWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends ConsumerState<TransactionsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<TransactionModel> transaction = [];
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
              child: DefaultTitle(title: TranslationFile.of(context)!.movTitle),
            ),
            Visibility(
              visible: ref.watch(transactionsProvider).isNotEmpty,
              replacement: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset(
                    transactionAnimation,
                    repeat: false,
                    height: 250,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DefaultTitle(
                      title:
                          TranslationFile.of(context)!.transactionNotFoundTitle,
                      titleSize: 27,
                      center: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    child: DefaultSubtitle(
                      TranslationFile.of(context)!.transactionNotFoundSubtitle,
                    ),
                  ),
                ],
              ),
              child: Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: ref.watch(transactionsProvider).length,
                  itemBuilder: (BuildContext context, int index) {
                    transaction.add(
                        ref.watch(transactionsProvider.state).state[index]);
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Column(
                        children: [
                          const Divider(
                            thickness: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DefaultSubtitle(
                                      "${formatCriptoCompleto.format(transaction[index].fromCryptoQtd)} ${transaction[index].fromCryptoAbrev.toUpperCase()}",
                                      strong: 600,
                                      size: 20,
                                      color: Colors.grey.shade500,
                                    ),
                                    DefaultSubtitle(
                                      formatDate
                                          .format(transaction[index].date)
                                          .toString(),
                                      strong: 600,
                                      size: 20,
                                      color: Colors.grey.shade500,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DefaultSubtitle(
                                      "${formatCriptoCompleto.format(transaction[index].toCryptoQtd)} ${transaction[index].toCryptoAbrev.toUpperCase()}",
                                      strong: 600,
                                      size: 20,
                                      color: Colors.black87,
                                    ),
                                    DefaultSubtitle(
                                      "R\$ ${formatReais.format(transaction[index].valueReais)}",
                                      strong: 600,
                                      size: 20,
                                      color: Colors.grey.shade500,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const DefaultNavbar(
        selectedIndex: 1,
      ),
    );
  }
}
