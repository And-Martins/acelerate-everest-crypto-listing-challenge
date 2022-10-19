import '../review/view/review_page.dart';
import '../confirmation/view/confirm_screen.dart';

import '../convert/view/convert_screen.dart';
import '../cripto_details/view/detail_screen.dart';
import '../transactions/view/transactions_screen.dart';
import '../wallet/view/wallet_screen.dart';

var routesNavigation = {
  '/wallet': (context) => const WalletScreen(),
  '/criptoMoviments': (context) => const TransactionsScreen(),
  '/criptoDetails': (context) => const DetailScreen(),
  '/convert': (context) => const ConvertScreen(),
  '/confirmConversion': (context) => const ReviewPage(),
  '/completeConversion': (context) => const ConfirmScreen()
};
