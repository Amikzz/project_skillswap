import 'package:flutter/material.dart';

class TextfieldLoginRegistration extends StatelessWidget {

  final String hint;
  final bool isPassword;
  final IconData icon;

  const TextfieldLoginRegistration({super.key, required this.hint, required this.icon, this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        icon: Icon(
          icon,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 15,
          fontFamily: 'Roboto',
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
