import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/widgets/default_navbar.dart';
import '../widgets/transaction_body.dart';

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
    return const Scaffold(
      body: TransactionBody(),
      bottomNavigationBar: DefaultNavbar(
        selectedIndex: 1,
      ),
    );
  }
}
