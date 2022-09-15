import 'package:crypto_listing/wallet/view/wallet_screen.dart';

import '../cripto_movements/view/movements_screen.dart';

var routesNavigation = {
  '/wallet': (context) => const WalletScreen(),
  '/criptoMoviments': (context) => const MovementsScreen(),
};
