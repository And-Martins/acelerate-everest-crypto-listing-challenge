import 'package:flutter/material.dart';

class CriptoIcon extends StatelessWidget {
  const CriptoIcon({
    Key? key,
    required this.criptoImage,
  }) : super(key: key);

  final String criptoImage;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: AssetImage(criptoImage),
      radius: 25,
    );
  }
}
