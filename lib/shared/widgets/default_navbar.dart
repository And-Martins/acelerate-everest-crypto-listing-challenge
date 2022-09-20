import 'package:crypto_listing/core/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/asset.dart';

class DefaultNavbar extends StatefulWidget {
  final int selectedIndex;

  const DefaultNavbar({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  State<DefaultNavbar> createState() => _DefaultNavbarState();
}

class _DefaultNavbarState extends State<DefaultNavbar> {
  void onItemTapped(int selectedIndex) {
    setState(
      () {
        switch (selectedIndex) {
          case 0:
            Navigator.pushReplacement(context, PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return routesNavigation['/wallet']!(context);
              },
            ));
            break;

          case 1:
            Navigator.pushReplacement(context, PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return routesNavigation['/criptoMoviments']!(context);
              },
            ));
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
