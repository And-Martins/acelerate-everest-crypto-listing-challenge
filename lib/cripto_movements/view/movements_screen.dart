import 'package:crypto_listing/cripto_details/repository/get_detail_repo_impl.dart';
import 'package:crypto_listing/cripto_details/usecases/get_detail_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../cripto_details/endpoint/get_detail_endpoint.dart';
import '../../shared/widgets/default_navbar.dart';

class MovementsScreen extends StatefulWidget {
  const MovementsScreen({Key? key}) : super(key: key);

  @override
  State<MovementsScreen> createState() => _MovementsScreenState();
}

class _MovementsScreenState extends State<MovementsScreen> {
  GetDetailUsecase usecase =
      GetDetailUsecase(GetDetailRepo(GetDetailEndpoint(Dio())));
  late Future<Response> cryptos;

  @override
  void initState() {
    // cryptos = usecase.getCriptoCoinList('bitcoin');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(usecase.toString()),
      // body: FutureBuilder(
      //   future: cryptos,
      //   builder: (context, AsyncSnapshot<List<CryptoModel>> snapshot) {
      //     if (snapshot.hasData) {
      //       return ListView.builder(
      //         itemCount: snapshot.data!.length,
      //         itemBuilder: (context, index) {
      //           CryptoModel listCryptoModel = snapshot.data![index];
      //           return Column(
      //             children: [
      //               Text(listCryptoModel.name),
      //             ],
      //           );
      //         },
      //       );
      //     } else {
      //       return const Center(child: CircularProgressIndicator());
      //     }
      //   },
      // ),
      // body: Column(
      //   children: const [
      //     Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 55),
      //       child: DefaultTitle(title: "Movimentações"),
      //     ),
      //   ],
      // ),
      bottomNavigationBar: const DefaultNavbar(
        selectedIndex: 1,
      ),
    );
  }
}
