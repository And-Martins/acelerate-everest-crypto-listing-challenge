import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/providers/wallet_providers.dart';
import '../../shared/widgets/number_formatter.dart';

class Graphic extends StatefulHookConsumerWidget {
  final List<FlSpot> defineSpot;
  final double days;

  const Graphic({
    Key? key,
    required this.defineSpot,
    required this.days,
  }) : super(key: key);

  @override
  ConsumerState<Graphic> createState() => _GraphicState();
}

class _GraphicState extends ConsumerState<Graphic> {
  @override
  Widget build(BuildContext context) {
    void changeValue(double newValue) async {
      ref.watch(criptoCotacaoProvider.state).state = newValue;
      initState();
    }

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
                spots: widget.defineSpot,
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
                    changeValue(touchedSpot.y);
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
            minX: widget.days - 1,
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
