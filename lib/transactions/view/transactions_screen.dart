import 'package:crypto_listing/transactions/model/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/widgets/default_navbar.dart';
import '../../shared/widgets/default_title.dart';
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
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 55),
            child: DefaultTitle(title: "Movimentações"),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: ref.watch(transactionsProvider).length,
              itemBuilder: (BuildContext context, int index) {
                transaction
                    .add(ref.watch(transactionsProvider.state).state[index]);
                return Column(
                  children: [
                    Text(transaction[index].fromCryptoAbrev.toString()),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const DefaultNavbar(
        selectedIndex: 1,
      ),
    );
  }
}
