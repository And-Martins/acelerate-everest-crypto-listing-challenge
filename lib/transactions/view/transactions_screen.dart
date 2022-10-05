import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../repository/crypto_list_repository.dart';
import '../../shared/models/crypto_list_model.dart';
import '../../shared/widgets/default_navbar.dart';
import '../../shared/widgets/default_title.dart';
import '../providers/transaction_providers.dart';

class TransactionsScreen extends StatefulHookConsumerWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends ConsumerState<TransactionsScreen> {
  CryptoListRepository repository = CryptoListRepository(Dio());
  late Future<List<CryptoListModel>> cryptoList;

  @override
  void initState() {
    cryptoList = repository.getList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ref.watch(transactionsProvider),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            child:
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 55),
                  child: DefaultTitle(title: "Movimentações"),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: const DefaultNavbar(
        selectedIndex: 1,
      ),
    );
  }
}
