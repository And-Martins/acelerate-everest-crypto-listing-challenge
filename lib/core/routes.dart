import 'package:crypto_listing/wallet/model/crypto_list/crypto_view_data.dart';
import 'package:decimal/decimal.dart';

import '../cripto_details/utils/detail_arguments.dart';
import '../cripto_details/view/detail_screen.dart';
import '../cripto_movements/view/movements_screen.dart';
import '../wallet/view/wallet_screen.dart';

var routesNavigation = {
  '/wallet': (context) => const WalletScreen(),
  '/criptoMoviments': (context) => const MovementsScreen(),
  '/criptoDetails': (context) => const DetailScreen(),
};
