import 'package:flutter/material.dart';

import '../../shared/widgets/default_appbar.dart';
import '../widgets/convert_body.dart';

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
      body: const ConvertBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
  
        backgroundColor: Colors.pink.shade500,
        child: const Icon(
          Icons.arrow_forward,
          size: 25,
          color: Colors.white,
        ),
      ),
    );
  }
}
