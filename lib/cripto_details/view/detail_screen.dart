import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../cripto_convert/view/convert_screen.dart';
import '../../shared/providers/wallet_providers.dart';
import '../../shared/widgets/default_appbar.dart';
import '../../shared/widgets/default_subtitle.dart';
import '../../shared/widgets/default_title.dart';
import '../../shared/widgets/number_formatter.dart';
import '../widgets/item_detail.dart';

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
    final double criptoCotacao = ref.watch(criptoCotacaoProvider);
    final double criptoVariacao = ref.watch(criptoVariacaoProvider);
    final double criptoValueWalletReais =
        ref.watch(criptoValueWalletReaisProvider);
    final double criptoQtdWallet = ref.watch(criptoQtdWalletCriptoProvider);

    return Scaffold(
      appBar: DefaultAppbar(
        title: "Detalhes",
        titleSize: 23,
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DefaultTitle(title: criptoName),
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
                  "R\$ ${formatReais.format(criptoCotacao)}",
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
              ItemDetail(
                opc: 1,
                criptoAbrev: criptoAbrev,
                criptoCotacao: criptoCotacao,
                criptoVariacao: criptoVariacao,
                criptoValueWalletReais: criptoValueWalletReais,
                criptoQtdWallet: criptoQtdWallet,
                text: "Preço atual",
              ),
              ItemDetail(
                opc: 2,
                criptoAbrev: criptoAbrev,
                criptoCotacao: criptoCotacao,
                criptoVariacao: criptoVariacao,
                criptoValueWalletReais: criptoValueWalletReais,
                criptoQtdWallet: criptoQtdWallet,
                text: "Variação 24H",
              ),
              ItemDetail(
                opc: 3,
                criptoAbrev: criptoAbrev,
                criptoCotacao: criptoCotacao,
                criptoVariacao: criptoVariacao,
                criptoValueWalletReais: criptoValueWalletReais,
                criptoQtdWallet: criptoQtdWallet,
                text: "Quantidade",
              ),
              ItemDetail(
                opc: 4,
                criptoAbrev: criptoAbrev,
                criptoCotacao: criptoCotacao,
                criptoVariacao: criptoVariacao,
                criptoValueWalletReais: criptoValueWalletReais,
                criptoQtdWallet: criptoQtdWallet,
                text: "Valor",
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const ConvertScreen();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      "Converter moeda",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
