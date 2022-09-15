import 'package:crypto_listing/wallet/view/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/asset.dart';
import '../../cripto_movements/view/movements_screen.dart';

class NavbarWallet extends StatefulWidget {
  const NavbarWallet({
    Key? key,
  }) : super(key: key);

  @override
  State<NavbarWallet> createState() => _NavbarWalletState();
}

class _NavbarWalletState extends State<NavbarWallet> {
  int selectedIndex = 0;

  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: const <Widget>[
          WalletScreen(),
          MovementsScreen(),
        ],
        onPageChanged: (index) {
          selectedIndex = index;
          setState(() {});
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              portifolioIcon,
              color: Colors.grey,
              width: 20,
              height: 20,
            ),
            activeIcon: SvgPicture.asset(
              portifolioIcon,
              width: 23,
              height: 23,
            ),
            label: 'Portifólio',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              movimentacoesIcon,
              color: Colors.grey,
              width: 20,
              height: 20,
            ),
            activeIcon: SvgPicture.asset(
              movimentacoesIcon,
              width: 23,
              height: 23,
            ),
            label: 'Movimentações',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          selectedIndex = index;
          pageController.jumpToPage(index);
          setState(() {});
        },
      ),
    );
  }
}
