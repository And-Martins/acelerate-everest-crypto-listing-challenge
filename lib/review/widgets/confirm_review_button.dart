import 'package:flutter/material.dart';

class ConfirmReviewButton extends StatelessWidget {
  const ConfirmReviewButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 55,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/complete-conversion',
            );
          },
          child: const Text(
            'Concluir conversão',
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
