import 'package:flutter/material.dart';

/// A widget that displays a text and a text button for login/signup screens.
///
/// This widget is typically used to provide a way for users to navigate
/// between login and signup screens.
class HaveAccountLoginSignup extends StatelessWidget {
  /// The first part of the text, e.g., "Already have an account?".
  final String text1;

  /// The second part of the text, which is a button, e.g., "Log In".
  final String text2;

  /// The callback function that is called when the button is pressed.
  final void Function() onPressed;

  /// Creates a [HaveAccountLoginSignup] widget.
  ///
  /// The [text1], [text2], and [onPressed] parameters must not be null.
  const HaveAccountLoginSignup({
    super.key,
    required this.text1,
    required this.text2,
    required this.onPressed,
  });

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
          onPressed: onPressed,
          child: Text(
            text2,
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ],
    );
  }
}