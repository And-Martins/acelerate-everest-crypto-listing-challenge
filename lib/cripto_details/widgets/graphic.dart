import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/providers/providers.dart';
import '../../shared/widgets/number_formatter.dart';

class Graphic extends StatefulHookConsumerWidget {
  final List<FlSpot> defineSpot;
  final int days;

  const Graphic({
    Key? key,
    required this.defineSpot,
    required this.days,
  }) : super(key: key);

  @override
  ConsumerState<Graphic> createState() => _GraphicState();
}

class _GraphicState extends ConsumerState<Graphic> {
  late List<FlSpot> spotsList;

//TODO - Testar o onChange
  @override
  Widget build(BuildContext context) {
    void changeValue(Decimal newValue) {
      ref.watch(cryptoCotacaoProvider.state).state =
          Decimal.parse(newValue.toString());
    }

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) =>
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
                  isStrokeCapRound: true,
                  spots: widget.defineSpot
                      .sublist(0, ref.watch(cryptoDaysProvider)),
                ),
              ],
              betweenBarsData: [],
              titlesData: FlTitlesData(show: false),
              extraLinesData: ExtraLinesData(),
              lineTouchData: LineTouchData(
                //TODO - Testar o onChange
                touchCallback: (FlTouchEvent event, lineTouchResponse) {
                  if (!event.isInterestedForInteractions) {
                    setState(() {
                      changeValue(
                          Decimal.parse(widget.defineSpot.last.y.toString()));
                    });
                  }
                  setState(
                    () {
                      if (lineTouchResponse?.lineBarSpots?.first.spotIndex !=
                          null) {
                        changeValue(
                          Decimal.parse(
                            widget
                                .defineSpot[lineTouchResponse!
                                    .lineBarSpots!.first.spotIndex]
                                .y
                                .toString(),
                          ),
                        );
                      }
                    },
                  );
                },
                touchTooltipData: LineTouchTooltipData(
                  fitInsideHorizontally: true,
                  tooltipBgColor: Colors.grey,
                  tooltipPadding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 5,
                  ),
                  tooltipRoundedRadius: 15,
                  //TODO - Testar o retorno do toque
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
            ),
          ),
        ),
      ),
    );
  }
}
