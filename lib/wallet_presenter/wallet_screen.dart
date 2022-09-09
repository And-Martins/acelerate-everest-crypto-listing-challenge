import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool hideWallet = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Carteira",
                  style: GoogleFonts.montserrat(
                      fontSize: 35, fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 197),
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
            Stack(
              children: [
                Text(
                  'US\$ 1.000,00',
                  style: GoogleFonts.montserrat(
                      fontSize: 35, fontWeight: FontWeight.w700),
                ),
                Visibility(
                  visible: hideWallet,
                  child: Container(
                    color: Colors.grey,
                    width: MediaQuery.of(context).size.width - 100,
                    height: MediaQuery.of(context).size.height - 642,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
