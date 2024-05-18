import 'package:flutter/material.dart';

class TextfieldLoginRegistration extends StatelessWidget {

  final String hint;

  const TextfieldLoginRegistration({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintStyle: const TextStyle(
          fontFamily: 'Roboto',
        ),
        hintText: hint,
      ),
    );
  }
}
