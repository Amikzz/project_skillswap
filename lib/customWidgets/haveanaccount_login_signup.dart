import 'package:flutter/material.dart';

class HaveAccountLoginSignup extends StatelessWidget {

  final String text1;
  final String text2;
  final void Function() onPressed;

  const HaveAccountLoginSignup({super.key, required this.text1, required this.text2, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text1,
            style: const TextStyle(
              fontFamily: 'Roboto',
            ),
          ),
          TextButton(
            onPressed: () {
              onPressed();
            },
            child: Text(
              text2,
              style: const TextStyle(
                fontFamily: 'Roboto',
                color: Colors.black,
              ),
            ),
          ),
        ]
    );
  }
}
