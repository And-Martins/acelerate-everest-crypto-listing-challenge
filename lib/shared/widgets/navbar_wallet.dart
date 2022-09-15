import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/asset.dart';

class NavbarWallet extends StatefulWidget {
  final int selectedIndex;

  const NavbarWallet({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  State<NavbarWallet> createState() => _NavbarWalletState();
}

class _NavbarWalletState extends State<NavbarWallet> {
  void onItemTapped(int selectedIndex) {
    setState(
      () {
        switch (selectedIndex) {
          case 0:
            Navigator.pushNamed(context, '/wallet');
            break;
          case 1:
            Navigator.pushNamed(context, '/criptoMoviments');
            break;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
      currentIndex: widget.selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: onItemTapped,
    );
  }
}
