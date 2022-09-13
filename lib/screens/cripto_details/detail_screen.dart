import 'package:crypto_listing/shared/template/default_subtitle.dart';
import 'package:crypto_listing/shared/template/default_title.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/template/wallet_providers.dart';

class DetailScreen extends StatefulHookConsumerWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final String criptoName = ref.watch(criptoNameProvider);
    final String criptoAbrev = ref.watch(criptoAbrevProvider);
    final String criptoImage = ref.watch(criptoImageProvider);

    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        elevation: 1,
        title: Text(
          "Detalhes",
          style: GoogleFonts.sourceSansPro(
            fontSize: 23,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DefaultTitle(title: criptoName, color: Colors.black),
                CircleAvatar(
                  backgroundImage: AssetImage(criptoImage),
                  radius: 25,
                ),
              ],
            ),
            DefaultSubtitle(criptoAbrev),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "R\$ 100.745,00",
                style: GoogleFonts.montserrat(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: LineChart(
                  LineChartData(
                    lineBarsData: [
                      LineChartBarData(
                          barWidth: 3.5,
                          color: const Color.fromRGBO(224, 43, 87, 1),
                          dotData: FlDotData(show: false),
                          spots: [
                            const FlSpot(0, 0),
                            const FlSpot(2, 2),
                            const FlSpot(3, 3),
                            const FlSpot(5, 2),
                            const FlSpot(6, 4),
                            const FlSpot(7, 5),
                            const FlSpot(8, 5),
                            const FlSpot(9, 6),
                            const FlSpot(10, 9),
                          ])
                    ],
                    betweenBarsData: [],
                    titlesData: FlTitlesData(show: false),
                    extraLinesData: ExtraLinesData(),
                    lineTouchData: LineTouchData(),
                    rangeAnnotations: RangeAnnotations(),
                    showingTooltipIndicators: [],
                    gridData: FlGridData(show: false),
                    borderData: FlBorderData(
                        border: const Border(
                      bottom: BorderSide(
                        width: 3,
                        color: Color.fromRGBO(227, 228, 235, 1),
                      ),
                    )),
                    minX: 0,
                    maxX: 10,
                    baselineX: 3,
                    minY: 0,
                    maxY: 15,
                    baselineY: 3,
                    clipData: FlClipData.none(),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
