import 'package:flutter/material.dart';

import '../../shared/template/default_appbar.dart';

class MovementsScreen extends StatelessWidget {
  const MovementsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(
        title: "Movimentações",
        titleSize: 30,
        appBar: AppBar(),
      ),
      body: Container(),
    );
  }
}
