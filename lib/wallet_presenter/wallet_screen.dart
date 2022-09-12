import 'package:crypto_listing/utils/asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'widgets/cripto_item.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool hideWallet = true;
  int _selectedIndex = 0;
  var format = NumberFormat('#,###.00#', 'pt_BR');

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Cripto",
                  style: GoogleFonts.montserrat(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: const Color.fromRGBO(224, 43, 87, 1)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 230),
                  child: IconButton(
                    onPressed: () {
                      if (hideWallet) {
                        setState(() => hideWallet = false);
                      } else {
                        setState(() => hideWallet = true);
                      }
                    },
                    icon: const Icon(Icons.remove_red_eye),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: hideWallet,
              replacement: Text(
                'R\$ ${format.format(14798.00)}',
                style: GoogleFonts.montserrat(
                    fontSize: 32, fontWeight: FontWeight.w800),
              ),
              child: Container(
                color: Colors.grey,
                width: MediaQuery.of(context).size.width - 100,
                height: MediaQuery.of(context).size.height - 644.3,
              ),
            ),
            Text(
              "Valor total de moedas",
              style: GoogleFonts.montserrat(
                fontSize: 17,
                color: const Color.fromRGBO(117, 118, 128, 1),
                fontWeight: FontWeight.w400,
              ),
            ),
            Expanded(
              child: SizedBox(
                child: ListView(
                  children: [
                    const Divider(),
                    CriptoItem(
                      abbreviation: 'BTC',
                      name: 'Bitcoin',
                      valueReais: 6557.0,
                      valueCripto: 0.65,
                      image: btc,
                      hideWallet: hideWallet,
                    ),
                    CriptoItem(
                      abbreviation: 'ETC',
                      name: 'Ethereum',
                      valueReais: 7996.00,
                      valueCripto: 0.94,
                      image: eth,
                      hideWallet: hideWallet,
                    ),
                    CriptoItem(
                      abbreviation: 'LTC',
                      name: 'Litecoin',
                      valueReais: 245.00,
                      valueCripto: 0.82,
                      image: ltc,
                      hideWallet: hideWallet,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
