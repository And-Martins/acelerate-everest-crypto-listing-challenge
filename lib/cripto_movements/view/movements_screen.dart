import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../repository/crypto_list_repository.dart';
import '../../shared/models/crypto_list_model.dart';
import '../../shared/widgets/default_navbar.dart';

class MovementsScreen extends StatefulWidget {
  const MovementsScreen({Key? key}) : super(key: key);

  @override
  State<MovementsScreen> createState() => _MovementsScreenState();
}

class _MovementsScreenState extends State<MovementsScreen> {
  CryptoListRepository repository = CryptoListRepository(Dio());
  late Future<List<CryptoListModel>> cryptoList;

  @override
  void initState() {
    cryptoList = repository.getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: cryptoList,
        builder: (context, AsyncSnapshot<List<CryptoListModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                CryptoListModel cryptoListModel = snapshot.data![index];
                return Column(
                  children: [
                    Text(cryptoListModel.base),
                    Text(cryptoListModel.baseId),
                    Text(cryptoListModel.currency),
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
