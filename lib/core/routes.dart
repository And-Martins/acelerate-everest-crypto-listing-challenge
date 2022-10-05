import 'package:crypto_listing/review/view/review_page.dart';
import 'package:crypto_listing/convert/widgets/complete_confirmation.dart';

import '../convert/view/convert_screen.dart';
import '../wallet/view/wallet_screen.dart';
import '../cripto_details/view/detail_screen.dart';
import '../cripto_movements/view/movements_screen.dart';

var routesNavigation = {
  '/wallet': (context) => const WalletScreen(),
  '/criptoMoviments': (context) => const MovementsScreen(),
  '/criptoDetails': (context) => const DetailScreen(),
  '/convert': (context) => const ConvertScreen(),
  '/confirm-conversion': (context) => const ReviewPage(),
  '/complete-conversion': (context) => const CompleteConfirmation()
};
