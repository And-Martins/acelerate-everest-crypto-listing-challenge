import 'package:crypto_listing/shared/widgets/default_title.dart';
import 'package:flutter/material.dart';

import '../../shared/widgets/default_appbar.dart';

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
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: DefaultTitle(
              title: "Quanto você gostaria de converter?",
              strong: 600,
            ),
          ),
        ],
      ),
    );
  }
}
