import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/widgets/default_title.dart';
import 'widgets/filter_option_container.dart';

class ConvertScreen extends StatelessWidget {
  const ConvertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    DefaultTitle(
                      title: "Conversão de moedas",
                      titleSize: 25,
                    ),
                  ],
                ),
              ),
              Text(
                "Converter de:",
                style: GoogleFonts.montserrat(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              //TODO Popular valores dinâmicamente
              const FilterOptionContainer(
                title: "Moeda",
                option: [
                  "Bitcoin",
                  "Ethereum",
                  "Litecoin",
                ],
              ),
              ElevatedButton(
                style: ButtonStyle(
                  // shadowColor: Colors.white,
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "25%",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
