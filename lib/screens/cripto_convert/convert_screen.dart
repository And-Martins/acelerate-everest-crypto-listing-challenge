import 'package:flutter/material.dart';

import '../../shared/template/default_appbar.dart';

class ConvertScreen extends StatelessWidget {
  const ConvertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(
        title: "Converter",
        titleSize: 23,
        appBar: AppBar(),
      ),
      body: Container(),
    );
  }
}
