import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../repository/crypto_list_repository.dart';
import '../../shared/models/crypto_list_model.dart';
import '../../shared/widgets/default_navbar.dart';
import '../../shared/widgets/default_title.dart';

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
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 55),
            child: DefaultTitle(title: "Movimentações"),
          ),
        ],
      ),
      bottomNavigationBar: const DefaultNavbar(
        selectedIndex: 1,
      ),
    );
  }
}
