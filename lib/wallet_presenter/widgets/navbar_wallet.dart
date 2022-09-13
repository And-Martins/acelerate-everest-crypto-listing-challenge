import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/asset.dart';

class NavbarWallet extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onItemTapped;

  const NavbarWallet({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            portifolioIcon,
            color: Colors.grey,
          ),
          activeIcon: SvgPicture.asset(portifolioIcon),
          label: 'Portifólio',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            movimentacoesIcon,
            color: Colors.grey,
          ),
          activeIcon: SvgPicture.asset(movimentacoesIcon),
          label: 'Movimentações',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: onItemTapped,
    );
  }
}
