import 'package:flutter/material.dart';

/// A custom text field widget for login and registration screens.
///
/// This widget displays a text field with an icon, a hint, and a border.
/// It can also be used for password fields.
class TextfieldLoginRegistration extends StatelessWidget {
  /// The hint text to be displayed in the text field.
  final String hint;

  /// Whether the text field is for a password.
  ///
  /// If this is true, the text will be obscured.
  final bool isPassword;

  /// The icon to be displayed on the left side of the text field.
  final IconData icon;

  /// The controller for the text field.
  final TextEditingController controller;

  /// The validator for the text field.
  final String? Function(String?)? validator;

  /// Creates a [TextfieldLoginRegistration] widget.
  ///
  /// The [hint], [icon], and [controller] parameters must not be null.
  const TextfieldLoginRegistration({
    super.key,
    required this.hint,
    required this.icon,
    this.isPassword = false,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller, // Use the controller
      obscureText: isPassword,
      validator: validator, // Use the validator
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
