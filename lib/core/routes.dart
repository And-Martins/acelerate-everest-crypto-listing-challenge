import 'package:crypto_listing/wallet/view/wallet_screen.dart';

import '../cripto_details/view/detail_screen.dart';
import '../cripto_movements/view/movements_screen.dart';

var routesNavigation = {
  '/wallet': (context) => const WalletScreen(),
  '/criptoMoviments': (context) => const MovementsScreen(),
  '/criptoDetails': (context) => const DetailScreen(),
};
