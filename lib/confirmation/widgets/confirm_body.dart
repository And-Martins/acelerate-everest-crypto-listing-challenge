import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/asset.dart';
import '../../shared/widgets/default_subtitle.dart';
import '../../shared/widgets/default_title.dart';

class ConfirmBody extends StatelessWidget {
  const ConfirmBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: SizedBox(
            height: 150,
            child: Lottie.asset(
              confirmAnimation,
              repeat: false,
            ),
          ),
        ),
        const DefaultTitle(title: "Conversão efetuada"),
        const DefaultSubtitle('Conversão de moeda efetuada com sucesso!')
      ],
    );
  }
}
