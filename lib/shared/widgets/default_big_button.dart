import 'package:flutter/material.dart';

class DefaultBigButton extends StatelessWidget {
  const DefaultBigButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 55,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text(
          "Converter moeda",
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
