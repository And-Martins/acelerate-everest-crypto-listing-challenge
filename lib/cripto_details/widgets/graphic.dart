import 'package:crypto_listing/shared/widgets/number_formatter.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Graphic extends StatelessWidget {
  final List<FlSpot> defineSpot;
  final double days;

  const Graphic({
    Key? key,
    required this.defineSpot,
    required this.days,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
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
                isStrokeCapRound: true,
                spots: defineSpot,
              ),
            ],
            betweenBarsData: [],
            titlesData: FlTitlesData(show: false),
            extraLinesData: ExtraLinesData(),
            lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                fitInsideHorizontally: true,
                tooltipBgColor: Colors.grey,
                tooltipPadding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 5,
                ),
                tooltipRoundedRadius: 15,
                getTooltipItems: (touchedSpots) {
                  return touchedSpots.map((touchedSpot) {
                    return LineTooltipItem(
                      "R\$ ${formatReais.format(touchedSpot.y)}",
                      const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }).toList();
                },
              ),
            ),
            rangeAnnotations: RangeAnnotations(),
            gridData: FlGridData(show: false),
            borderData: FlBorderData(
              border: const Border(
                bottom: BorderSide(
                  width: 3,
                  color: Color.fromRGBO(227, 228, 235, 1),
                ),
              ),
            ),
            minX: days - 1,
            maxX: -0.2,
            baselineX: 3,
            minY: 0,
            maxY: 103612.60,
            clipData: FlClipData.all(),
          ),
        ),
      ),
    );
  }
}
