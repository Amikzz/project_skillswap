import 'package:flutter/material.dart';

/// A custom elevated button widget for startup screens.
///
/// This widget displays an elevated button with a specific style, and it can
/// show a loading indicator.
class StartupElevatedButton extends StatelessWidget {
  /// The callback function that is called when the button is pressed.
  ///
  /// If this is null, the button will be disabled.
  final void Function()? onPressed;

  /// The text to be displayed on the button.
  final String text;

  /// The background color of the button.
  final Color? backgroundColor;

  /// The foreground color of the button (text and icon).
  final Color? foregroundColor;

  /// Whether the button is in a loading state.
  ///
  /// If this is true, a [CircularProgressIndicator] will be displayed instead
  /// of the text, and the button will be disabled.
  final bool isLoading;

  /// Creates a [StartupElevatedButton] widget.
  ///
  /// The [onPressed] and [text] parameters must not be null.
  const StartupElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        animationDuration: const Duration(milliseconds: 1000),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        fixedSize: const Size(220, 60),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shadowColor: Colors.grey,
        elevation: 8,
      ),
      onPressed: isLoading ? null : onPressed, // Disable while loading
      child: isLoading
          ? const CircularProgressIndicator(color: Colors.white)
          : Text(
        text,
        style: TextStyle(
          color: foregroundColor,
          fontFamily: 'Roboto',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}