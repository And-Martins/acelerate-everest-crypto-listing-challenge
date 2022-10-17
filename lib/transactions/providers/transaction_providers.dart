import 'package:crypto_listing/transactions/model/transaction_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final transactionsProvider = StateProvider<List<TransactionModel>>((ref) => []);
