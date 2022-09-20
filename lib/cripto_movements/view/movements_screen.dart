import 'package:crypto_listing/list_cripto_api/list_crypto_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../list_cripto_api/list_crypto_model.dart';
import '../../shared/widgets/default_navbar.dart';

class MovementsScreen extends StatefulWidget {
  const MovementsScreen({Key? key}) : super(key: key);

  @override
  State<MovementsScreen> createState() => _MovementsScreenState();
}

class _MovementsScreenState extends State<MovementsScreen> {
  ListCryptoRepository repository = ListCryptoRepository(Dio());
  late Future<List<ListCryptoModel>> cryptos;

  @override
  void initState() {
    cryptos = repository.getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: cryptos,
        builder: (context, AsyncSnapshot<List<ListCryptoModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                ListCryptoModel listCryptoModel = snapshot.data![index];
                return Column(
                  children: [
                    Text(listCryptoModel.name),
                  ],
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
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
