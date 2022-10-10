import 'package:flutter/material.dart';

import '../../shared/widgets/default_appbar.dart';
import '../widgets/confirm_button.dart';
import '../widgets/convert_body.dart';

class ConvertScreen extends StatelessWidget {
  const ConvertScreen({Key? key}) : super(key: key);
  static const zeroAlert = SnackBar(
    backgroundColor: Colors.red,
    content: Text('Por favor insira um valor!'),
  );
  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      appBar: DefaultAppbar(
        title: "Converter",
        titleSize: 23,
      ),
      body: ConvertBody(),
      floatingActionButton: ConfirmButton(zeroAlert: zeroAlert),
    );
  }
}
