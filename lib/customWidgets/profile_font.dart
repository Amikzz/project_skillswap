import 'package:flutter/material.dart';

/// A widget that displays text with a specific style for profile screens.
///
/// This widget is used to display text with a bold "Roboto" font.
class ProfileFont extends StatelessWidget {
  /// The text to be displayed.
  final String text;

  /// The font size of the text.
  final double size;

  /// Creates a [ProfileFont] widget.
  ///
  /// The [text] and [size] parameters must not be null.
  const ProfileFont({super.key, required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto'
        )
    );
  }
}
