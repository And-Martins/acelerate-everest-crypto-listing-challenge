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
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 55.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Carteira",
                  style: GoogleFonts.montserrat(
                      fontSize: 32, fontWeight: FontWeight.w800),
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
            Visibility(
              visible: hideWallet,
              replacement: Text(
                'US\$ 1.000,00',
                style: GoogleFonts.montserrat(
                    fontSize: 32, fontWeight: FontWeight.w800),
              ),
              child: Container(
                color: Colors.grey,
                width: MediaQuery.of(context).size.width - 100,
                height: MediaQuery.of(context).size.height - 642,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 197,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: [
                  ListTile(
                    leading: const CircleAvatar(),
                    title: Text("ETC",
                        style: GoogleFonts.sourceSansPro(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        )),
                    subtitle: Text("Etherium",
                        style: GoogleFonts.sourceSansPro(fontSize: 15)),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "US\$ 0,00",
                          style: GoogleFonts.sourceSansPro(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color.fromRGBO(160, 244, 224, 1),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7.0, vertical: 3.0),
                          child: Text("+75%",
                              style: GoogleFonts.sourceSansPro(fontSize: 12)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
